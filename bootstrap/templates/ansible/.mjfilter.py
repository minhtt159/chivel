# main = lambda data: data.get("bootstrap_distribution", "k3s") in ["k3s"]
def main(data):
    return data.get("bootstrap_distribution", "k3s") in ["k3s"]
