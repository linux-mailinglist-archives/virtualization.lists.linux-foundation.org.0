Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 414A41FA18A
	for <lists.virtualization@lfdr.de>; Mon, 15 Jun 2020 22:32:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E033C86CAF;
	Mon, 15 Jun 2020 20:32:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c8dOrDJl2LtK; Mon, 15 Jun 2020 20:32:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5180F86CB7;
	Mon, 15 Jun 2020 20:32:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 238CEC016E;
	Mon, 15 Jun 2020 20:32:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08781C016E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 20:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E4DC886CAF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 20:32:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9O-WAUPXxMHF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 20:32:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4C4AD86CA0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 20:32:01 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8999B20663;
 Mon, 15 Jun 2020 20:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592253121;
 bh=cfd4DVNPuY/Bqr/rIY9FRSn2nAgsPv7avGkr45XURZo=;
 h=Subject:To:Cc:From:Date:From;
 b=HDoFEH4bf5ej91guuClM8YOiSZa1Tdm7pARw470uH/wyuqODsczgldRj3WkmVsrZi
 ynXojuaBx8zGqZ40HeNlGCJKQDVOfNgSen0d9/HJEKNLh889RRbFwfAO3pG1sgZ/1g
 VjDdVg+HKJ6F7w/mEDsmDKL9BOyc6kPFmZUnHYDc=
Subject: Patch "crypto: virtio: Fix dest length calculation in
 __virtio_crypto_skcipher_do_req()" has been added to the 5.6-stable tree
To: arei.gonglei@huawei.com, davem@davemloft.net, gregkh@linuxfoundation.org,
 herbert@gondor.apana.org.au, jasowang@redhat.com, longpeng2@huawei.com,
 mst@redhat.com, virtualization@lists.linux-foundation.org
From: <gregkh@linuxfoundation.org>
Date: Mon, 15 Jun 2020 22:31:43 +0200
Message-ID: <159225310314259@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
Cc: stable-commits@vger.kernel.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


This is a note to let you know that I've just added the patch titled

    crypto: virtio: Fix dest length calculation in __virtio_crypto_skcipher_do_req()

to the 5.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     crypto-virtio-fix-dest-length-calculation-in-__virtio_crypto_skcipher_do_req.patch
and it can be found in the queue-5.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From d90ca42012db2863a9a30b564a2ace6016594bda Mon Sep 17 00:00:00 2001
From: "Longpeng(Mike)" <longpeng2@huawei.com>
Date: Tue, 2 Jun 2020 15:05:01 +0800
Subject: crypto: virtio: Fix dest length calculation in __virtio_crypto_skcipher_do_req()

From: Longpeng(Mike) <longpeng2@huawei.com>

commit d90ca42012db2863a9a30b564a2ace6016594bda upstream.

The src/dst length is not aligned with AES_BLOCK_SIZE(which is 16) in some
testcases in tcrypto.ko.

For example, the src/dst length of one of cts(cbc(aes))'s testcase is 17, the
crypto_virtio driver will set @src_data_len=16 but @dst_data_len=17 in this
case and get a wrong at then end.

  SRC: pp pp pp pp pp pp pp pp pp pp pp pp pp pp pp pp pp (17 bytes)
  EXP: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc pp (17 bytes)
  DST: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc 00 (pollute the last bytes)
  (pp: plaintext  cc:ciphertext)

Fix this issue by limit the length of dest buffer.

Fixes: dbaf0624ffa5 ("crypto: add virtio-crypto driver")
Cc: Gonglei <arei.gonglei@huawei.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: virtualization@lists.linux-foundation.org
Cc: linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
Link: https://lore.kernel.org/r/20200602070501.2023-4-longpeng2@huawei.com
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/crypto/virtio/virtio_crypto_algs.c |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/crypto/virtio/virtio_crypto_algs.c
+++ b/drivers/crypto/virtio/virtio_crypto_algs.c
@@ -402,6 +402,7 @@ __virtio_crypto_skcipher_do_req(struct v
 		goto free;
 	}
 
+	dst_len = min_t(unsigned int, req->cryptlen, dst_len);
 	pr_debug("virtio_crypto: src_len: %u, dst_len: %llu\n",
 			req->cryptlen, dst_len);
 


Patches currently in stable-queue which might be from longpeng2@huawei.com are

queue-5.6/crypto-virtio-fix-src-dst-scatterlist-calculation-in-__virtio_crypto_skcipher_do_req.patch
queue-5.6/crypto-virtio-fix-dest-length-calculation-in-__virtio_crypto_skcipher_do_req.patch
queue-5.6/crypto-virtio-fix-use-after-free-in-virtio_crypto_skcipher_finalize_req.patch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
