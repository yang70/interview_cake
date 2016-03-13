# Inverview Cake - sample question 8
# Write a function to see if a binary tree ↴ is "superbalanced" 
# (a new tree property we just made up). tree is "superbalanced" if the 
# difference between the depths of any two leaf nodes is no greater than one.
class BinaryTreeNode

  attr_accessor :value
  attr_reader :left, :right

  def initialize(value)
    @value = value
    @left  = nil
    @right = nil
  end

  def insert_left(value)
    @left = BinaryTreeNode.new(value)
    return @left
  end

  def insert_right(value)
    @right = BinaryTreeNode.new(value)
    return @right
  end
end

# Create test tree, will not be superbalanced
new_tree = BinaryTreeNode.new(3)
new_tree.insert_left 2
new_tree.insert_right 4
new_tree.right.insert_right 5
new_tree.right.right.insert_right 6

# initial instinct is a recursive solution, however as the solution shows,
# an iterative solution is more efficient, takes up less memory and allows us
# to short circuit to false as soon as conditions are met

def superbalance_check(tree_root)
  # write the body of your function here
  p "running with #{tree_root}"
    
  # Array of discovered depths, should be unique
  depths = []

  # Array of remaining nodes to check depth
  nodes = []
  # 2d array of nodes/depths, initially add tree root along with depth of 0
  nodes.push([tree_root, 0])

  # Continue to loop while there are still nodes to check
  while !nodes.empty?
    # remove first pair and assign to variables
    node, depth = nodes.pop

    # check if current node is a leaf node
    if !node.left && !node.right

      # if node is leaf, check if depth array contains this depth first
      if !depths.include? depth

        # if depths array does not contain current depth, add it to array
        depths.push depth

        # if the depths array has more than 3 unique depths, short circuit false
        # also short circuit false if there are 2 depths and difference > 1
        if depths.length > 2 || (depths.length == 2 && ((depths[0] - depths[1]).abs > 1))

          # return false if either above are true
          return false

        end

      end

    else

      # push next nodes to nodes array and add a level of depth if still running
      nodes.push [node.left, depth + 1] if node.left
      nodes.push [node.right, depth + 1] if node.right

    end

  end

  # return true if depth array check never short circuits, is superbalanced
  return true

end

superbalance_check new_tree # => false
# >> "running with #<BinaryTreeNode:0x007f890c129f98>"
