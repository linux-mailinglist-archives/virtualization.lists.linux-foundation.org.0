Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 497D916983A
	for <lists.virtualization@lfdr.de>; Sun, 23 Feb 2020 16:06:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CED8F203A6;
	Sun, 23 Feb 2020 15:06:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id URcsI5FKIlQV; Sun, 23 Feb 2020 15:06:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0158C20368;
	Sun, 23 Feb 2020 15:06:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CEEA9C1D8E;
	Sun, 23 Feb 2020 15:06:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9BF34C0177
 for <virtualization@lists.linux-foundation.org>;
 Sun, 23 Feb 2020 15:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 88E6D85218
 for <virtualization@lists.linux-foundation.org>;
 Sun, 23 Feb 2020 15:06:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 162x9kFdUubc
 for <virtualization@lists.linux-foundation.org>;
 Sun, 23 Feb 2020 15:06:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by whitealder.osuosl.org (Postfix) with ESMTPS id ACE1584E0C
 for <virtualization@lists.linux-foundation.org>;
 Sun, 23 Feb 2020 15:06:14 +0000 (UTC)
Received: from dggeml405-hub.china.huawei.com (unknown [172.30.72.54])
 by Forcepoint Email with ESMTP id 24FA44E78D2DE86FD79A;
 Sun, 23 Feb 2020 23:06:10 +0800 (CST)
Received: from DGGEML511-MBX.china.huawei.com ([169.254.1.89]) by
 dggeml405-hub.china.huawei.com ([10.3.17.49]) with mapi id 14.03.0439.000;
 Sun, 23 Feb 2020 23:06:01 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: LABBE Corentin <clabbe@baylibre.com>
Subject: RE: [CRASH] crypto: virtio: crash when modprobing tcrypt on 5.5-rc7
 / next-20200122
Thread-Topic: [CRASH] crypto: virtio: crash when modprobing tcrypt on
 5.5-rc7 / next-20200122
Thread-Index: AQHV0dVNhsJsLHebl0+mdNNoLPAyfKgKTXoAgBnNFYCABPE9UA==
Date: Sun, 23 Feb 2020 15:06:00 +0000
Message-ID: <33183CC9F5247A488A2544077AF19020DF4B2ED4@dggeml511-mbx.china.huawei.com>
References: <20200123101000.GB24255@Red>
 <20200204041419-mutt-send-email-mst@kernel.org> <20200220191553.GA30549@Red>
In-Reply-To: <20200220191553.GA30549@Red>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.133.225.234]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "Liujinsong \(Paul\)" <liu.jinsong@huawei.com>,
 "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
 "mst@redhat.com" <mst@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>
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


> -----Original Message-----
> From: LABBE Corentin [mailto:clabbe@baylibre.com]
> Sent: Friday, February 21, 2020 3:16 AM
> To: Gonglei (Arei) <arei.gonglei@huawei.com>
> Cc: jasowang@redhat.com; herbert@gondor.apana.org.au;
> davem@davemloft.net; virtualization@lists.linux-foundation.org;
> linux-crypto@vger.kernel.org; linux-kernel@vger.kernel.org; mst@redhat.com
> Subject: Re: [CRASH] crypto: virtio: crash when modprobing tcrypt on 5.5-rc7 /
> next-20200122
> 
> On Tue, Feb 04, 2020 at 04:15:22AM -0500, Michael S. Tsirkin wrote:
> > On Thu, Jan 23, 2020 at 11:10:00AM +0100, LABBE Corentin wrote:
> > > Hello
> > >
> > > When modprobing tcrypt on qemu 4.1.0 I get a kernel panic on 5.5-rc7
> > > and next-20200122 qemu is started by:
> > > /usr/bin/qemu-system-x86_64 -cpu host -enable-kvm -nographic -net
> > > nic,model=e1000,macaddr=52:54:00:12:34:58 -net tap -m 512 -monitor
> > > none -object cryptodev-backend-builtin,id=cryptodev0 -device
> > > virtio-crypto-pci,id=crypto0,cryptodev=cryptodev0 -append
> > > 'console=ttyS0 root=/dev/ram0 ip=dhcp' -kernel
> > > /var/lib/lava/dispatcher/tmp/41332/deployimages-td18675m/kernel/bzIm
> > > age -initrd
> > > /var/lib/lava/dispatcher/tmp/41332/deployimages-td18675m/ramdisk/roo
> > > tfs.cpio.gz -drive
> > > format=qcow2,file=/var/lib/lava/dispatcher/tmp/41332/apply-overlay-g
> > > uest-icy4k1ol/lava-guest.qcow2,media=disk,if=ide,id=lavatest
> > >
> > > [  112.771925] general protection fault: 0000 [#1] SMP PTI [
> > > 112.772686] CPU: 0 PID: 126 Comm: virtio0-engine Not tainted
> > > 5.5.0-rc7+ #1 [  112.773576] Hardware name: QEMU Standard PC (i440FX
> > > + PIIX, 1996), BIOS
> > > ?-20190711_202441-buildvm-armv7-10.arm.fedoraproject.org-2.fc31
> > > 04/01/2014 [  112.775319] RIP: 0010:sg_next+0x0/0x20 [  112.775821]
> > > Code: cc cc cc cc cc cc cc cc cc cc c7 47 10 00 00 00 00 89 57 0c 48
> > > 89 37 89 4f 08 c3 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 <f6>
> > > 07 02 75 17 48 8b 57 20 48 8d 47 20 48 89 d1 48 83 e1 fc 83 e2 [
> > > 112.778330] RSP: 0018:ffffa92440237d90 EFLAGS: 00010006 [
> > > 112.779071] RAX: fefefefe00000000 RBX: 000000000000000a RCX:
> > > fefefefe00000000 [  112.780081] RDX: 0000000000000001 RSI:
> > > ffff9b19da1a2180 RDI: fefefefe00000000 [  112.781081] RBP:
> > > ffff9b19da1a2198 R08: ffff9b19dfb24ee8 R09: 0000000000000a20 [
> > > 112.782079] R10: ffff9b19da125010 R11: 0000000000000000 R12:
> ffff9b19da1a21b8 [  112.783079] R13: 0000000000000003 R14:
> ffff9b19da1a2180 R15: 0000000000000004 [  112.784077] FS:
> 0000000000000000(0000) GS:ffff9b19de400000(0000)
> knlGS:0000000000000000 [  112.785202] CS:  0010 DS: 0000 ES: 0000 CR0:
> 0000000080050033 [  112.786030] CR2: 00007f18a157b050 CR3:
> 000000001040a004 CR4: 0000000000060ef0 [  112.787034] Call Trace:
> > > [  112.787393]  virtqueue_add_sgs+0x4c/0x90 [  112.787998]
> > > virtio_crypto_skcipher_crypt_req+0x310/0x3e0
> > > [  112.788817]  crypto_pump_work+0x10c/0x240 [  112.789420]  ?
> > > __kthread_init_worker+0x50/0x50 [  112.790082]
> > > kthread_worker_fn+0x89/0x180 [  112.790690]  kthread+0x10e/0x130 [
> > > 112.791182]  ? kthread_park+0x80/0x80 [  112.791736]
> > > ret_from_fork+0x35/0x40 [  112.792282] Modules linked in: cts lzo
> > > salsa20_generic camellia_x86_64 camellia_generic fcrypt pcbc tgr192
> > > anubis wp512 khazad tea michael_mic arc4 cast6_generic cast5_generic
> > > cast_common deflate sha512_ssse3 sha512_generic cfb ofb
> > > serpent_sse2_x86_64 serpent_generic lrw twofish_x86_64_3way
> > > twofish_x86_64 crypto_simd cryptd glue_helper twofish_generic
> > > twofish_common blowfish_x86_64 blowfish_generic blowfish_common md4
> > > tcrypt(+) [  112.797652] ---[ end trace 4a8142d4a08c2518 ]--- [
> > > 112.798320] RIP: 0010:sg_next+0x0/0x20 [  112.798865] Code: cc cc cc
> > > cc cc cc cc cc cc cc c7 47 10 00 00 00 00 89 57 0c 48 89 37 89 4f 08
> > > c3 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 <f6> 07 02 75 17 48
> > > 8b 57 20 48 8d 47 20 48 89 d1 48 83 e1 fc 83 e2 [  112.801452] RSP:
> > > 0018:ffffa92440237d90 EFLAGS: 00010006 [  112.802189] RAX:
> > > fefefefe00000000 RBX: 000000000000000a RCX: fefefefe00000000 [
> > > 112.803190] RDX: 0000000000000001 RSI: ffff9b19da1a2180 RDI:
> > > fefefefe00000000 [  112.804192] RBP: ffff9b19da1a2198 R08:
> > > ffff9b19dfb24ee8 R09: 0000000000000a20 [  112.805201] R10:
> > > ffff9b19da125010 R11: 0000000000000000 R12: ffff9b19da1a21b8 [
> > > 112.806195] R13: 0000000000000003 R14: ffff9b19da1a2180 R15:
> > > 0000000000000004 [  112.807222] FS:  0000000000000000(0000)
> > > GS:ffff9b19de400000(0000) knlGS:0000000000000000 [  112.808352] CS:
> > > 0010 DS: 0000 ES: 0000 CR0: 0000000080050033 [  112.809169] CR2:
> > > 00007f18a157b050 CR3: 000000001040a004 CR4: 0000000000060ef0
> > >
> > > I have tested also 5.4.14
> > > and I got random freeze with:
> > > qemu-system-x86_64: virtio: zero sized buffers are not allowed
> > >
> > > Regards
> >
> > Cc: Gonglei <arei.gonglei@huawei.com>
> >
> 
> Hello Gonglei
> 
> Any plan to fix the driver ? It is broken since its introduction.
> 
Thanks for your report firstly.
I've been busy launching new products recently, so I don't have much time
to invest in the open source community. 

I spent some time investigating the BUG this weekend, 
and IMO I found the root cause. The following patch, please help test it, thanks!

[PATCH] virtio-crypto: fix src/dst scatterlist calculation

Usually the next entry of one sg will be @sg@ + 1, but if this sg element
is part of a chained scatterlist, it could jump to the start of a new
scatterlist array. Let's fix it by sg_next() on calculation of src/dst
scatterlist.

BTW I add a check for sg_nents_for_len() its return value since
sg_nents_for_len() function could fail.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 drivers/crypto/virtio/virtio_crypto_algs.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/virtio/virtio_crypto_algs.c b/drivers/crypto/virtio/virtio_crypto_algs.c
index fd045e64..bde0539 100644
--- a/drivers/crypto/virtio/virtio_crypto_algs.c
+++ b/drivers/crypto/virtio/virtio_crypto_algs.c
@@ -355,8 +355,14 @@ static int virtio_crypto_skcipher_setkey(struct crypto_skcipher *tfm,
 	unsigned int num_out = 0, num_in = 0;
 	int sg_total;
 	uint8_t *iv;
+	struct scatterlist *sg;
 
 	src_nents = sg_nents_for_len(req->src, req->cryptlen);
+	if (src_nents < 0) {
+		pr_err("Invalid number of src SG.\n");
+		return src_nents;
+	}
+
 	dst_nents = sg_nents(req->dst);
 
 	pr_debug("virtio_crypto: Number of sgs (src_nents: %d, dst_nents: %d)\n",
@@ -442,12 +448,18 @@ static int virtio_crypto_skcipher_setkey(struct crypto_skcipher *tfm,
 	vc_sym_req->iv = iv;
 
 	/* Source data */
-	for (i = 0; i < src_nents; i++)
-		sgs[num_out++] = &req->src[i];
+	sg = req->src;
+	for (i = 0; sg && i < src_nents; sg = sg_next(sg)) {
+		i++;
+		sgs[num_out++] = sg;
+	}
 
 	/* Destination data */
-	for (i = 0; i < dst_nents; i++)
-		sgs[num_out + num_in++] = &req->dst[i];
+	sg = req->dst;
+	for (i = 0; sg && i < dst_nents; sg = sg_next(sg)) {
+		i++;
+		sgs[num_out + num_in++] = sg;
+	}
 
 	/* Status */
 	sg_init_one(&status_sg, &vc_req->status, sizeof(vc_req->status));
-- 
1.8.3.1


Regards
-Gonglei
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
