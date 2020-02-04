Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C760151791
	for <lists.virtualization@lfdr.de>; Tue,  4 Feb 2020 10:15:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BAB5086F21;
	Tue,  4 Feb 2020 09:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K3DaD0SGlqLY; Tue,  4 Feb 2020 09:15:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 97D8286EA5;
	Tue,  4 Feb 2020 09:15:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6801CC0174;
	Tue,  4 Feb 2020 09:15:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF0BAC0174
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 09:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C89882036B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 09:15:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yuKFrA4h5L-i
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 09:15:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id A48E61FD90
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 09:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580807733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XcERBKLD0pNCQ+9nUGC0SljdPFd4QEpox0vzFppf7MM=;
 b=ihy/7ccSCyxa4ZzArKP2e1qN1cxeaVjEevMs95rRrpNfb9O0Fy7TPRsDtHYbVDLnFjxQ65
 IkpaayR2Tp97A9RY+aPYrY406MUA3HTdWElBRzAzAz9iiwR01UDVKSfono3TZ+RuxETVXe
 mXQ4S8UsxCKwahdiCJKmlNb9+9c2/Cs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-e1b_PKtsOVi4mqmfla2mJw-1; Tue, 04 Feb 2020 04:15:30 -0500
Received: by mail-qt1-f200.google.com with SMTP id m8so11919548qta.20
 for <virtualization@lists.linux-foundation.org>;
 Tue, 04 Feb 2020 01:15:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XcERBKLD0pNCQ+9nUGC0SljdPFd4QEpox0vzFppf7MM=;
 b=Fb1YhhhqOjSmUigMGaHeIK2kSJkAdStj/MQsGwcWzysK3gm3U36lT6Q8126nLrylyL
 WkPcaOM7mQbJyF+FwVC011I/nprYGLutWP1je51V1zWs3cuMXg0MmwhTIhTVJl9lv/kJ
 p86pFKg7b4cwsYjIF8WczcY9Zf/1CNzlX44KeQwjxRy6JI4eEraA9y3TOwfbo6ILDCc9
 qD5OICimFyXZrEThdBWv8G+JrD9IeMdm2Q+oe/Fi55+JbKg71QcSWFppAn5PG4ppuHF+
 02b51UrzHQw3w3c7iNuKW9A1kFokqonOZecaS1LwkzYCRPa3rwJSF7PF9rfeF0Rd+8G8
 SfXw==
X-Gm-Message-State: APjAAAVaicDufE3BDIQ0SoqFFEgwPww3Q1PttZdpzoE6opX0HMXl5Jxo
 HirolvESnNdYZNUztdEAyZCMPE/O3CPSpgL0Fggmj+TbWkVqZzzzc5FnvDsbGGuVwlTsipGKmYh
 i8D8EtbF9U0WJxF4lPDSqMbvgDI/GhMz5GLp+z5tjaQ==
X-Received: by 2002:a37:9ce:: with SMTP id 197mr27871951qkj.194.1580807728517; 
 Tue, 04 Feb 2020 01:15:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqwKvgkclu5BLnLevhgiDeKWmCIEv4uhSFnYEH08g1U+qD+zdZhxrHLCADZ7VXCufD1Ywynifw==
X-Received: by 2002:a37:9ce:: with SMTP id 197mr27871932qkj.194.1580807728267; 
 Tue, 04 Feb 2020 01:15:28 -0800 (PST)
Received: from redhat.com (bzq-109-64-11-187.red.bezeqint.net. [109.64.11.187])
 by smtp.gmail.com with ESMTPSA id t7sm10703873qkm.136.2020.02.04.01.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 01:15:27 -0800 (PST)
Date: Tue, 4 Feb 2020 04:15:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: LABBE Corentin <clabbe@baylibre.com>
Subject: Re: [CRASH] crypto: virtio: crash when modprobing tcrypt on 5.5-rc7
 / next-20200122
Message-ID: <20200204041419-mutt-send-email-mst@kernel.org>
References: <20200123101000.GB24255@Red>
MIME-Version: 1.0
In-Reply-To: <20200123101000.GB24255@Red>
X-MC-Unique: e1b_PKtsOVi4mqmfla2mJw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: herbert@gondor.apana.org.au, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-crypto@vger.kernel.org,
 davem@davemloft.net
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

On Thu, Jan 23, 2020 at 11:10:00AM +0100, LABBE Corentin wrote:
> Hello
> 
> When modprobing tcrypt on qemu 4.1.0 I get a kernel panic on 5.5-rc7 and next-20200122
> qemu is started by:
> /usr/bin/qemu-system-x86_64 -cpu host -enable-kvm -nographic -net nic,model=e1000,macaddr=52:54:00:12:34:58 -net tap -m 512 -monitor none -object cryptodev-backend-builtin,id=cryptodev0 -device virtio-crypto-pci,id=crypto0,cryptodev=cryptodev0 -append 'console=ttyS0 root=/dev/ram0 ip=dhcp' -kernel /var/lib/lava/dispatcher/tmp/41332/deployimages-td18675m/kernel/bzImage -initrd /var/lib/lava/dispatcher/tmp/41332/deployimages-td18675m/ramdisk/rootfs.cpio.gz -drive format=qcow2,file=/var/lib/lava/dispatcher/tmp/41332/apply-overlay-guest-icy4k1ol/lava-guest.qcow2,media=disk,if=ide,id=lavatest
> 
> [  112.771925] general protection fault: 0000 [#1] SMP PTI
> [  112.772686] CPU: 0 PID: 126 Comm: virtio0-engine Not tainted 5.5.0-rc7+ #1
> [  112.773576] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS ?-20190711_202441-buildvm-armv7-10.arm.fedoraproject.org-2.fc31 04/01/2014
> [  112.775319] RIP: 0010:sg_next+0x0/0x20
> [  112.775821] Code: cc cc cc cc cc cc cc cc cc cc c7 47 10 00 00 00 00 89 57 0c 48 89 37 89 4f 08 c3 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 <f6> 07 02 75 17 48 8b 57 20 48 8d 47 20 48 89 d1 48 83 e1 fc 83 e2
> [  112.778330] RSP: 0018:ffffa92440237d90 EFLAGS: 00010006
> [  112.779071] RAX: fefefefe00000000 RBX: 000000000000000a RCX: fefefefe00000000
> [  112.780081] RDX: 0000000000000001 RSI: ffff9b19da1a2180 RDI: fefefefe00000000
> [  112.781081] RBP: ffff9b19da1a2198 R08: ffff9b19dfb24ee8 R09: 0000000000000a20
> [  112.782079] R10: ffff9b19da125010 R11: 0000000000000000 R12: ffff9b19da1a21b8
> [  112.783079] R13: 0000000000000003 R14: ffff9b19da1a2180 R15: 0000000000000004
> [  112.784077] FS:  0000000000000000(0000) GS:ffff9b19de400000(0000) knlGS:0000000000000000
> [  112.785202] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  112.786030] CR2: 00007f18a157b050 CR3: 000000001040a004 CR4: 0000000000060ef0
> [  112.787034] Call Trace:
> [  112.787393]  virtqueue_add_sgs+0x4c/0x90
> [  112.787998]  virtio_crypto_skcipher_crypt_req+0x310/0x3e0
> [  112.788817]  crypto_pump_work+0x10c/0x240
> [  112.789420]  ? __kthread_init_worker+0x50/0x50
> [  112.790082]  kthread_worker_fn+0x89/0x180
> [  112.790690]  kthread+0x10e/0x130
> [  112.791182]  ? kthread_park+0x80/0x80
> [  112.791736]  ret_from_fork+0x35/0x40
> [  112.792282] Modules linked in: cts lzo salsa20_generic camellia_x86_64 camellia_generic fcrypt pcbc tgr192 anubis wp512 khazad tea michael_mic arc4 cast6_generic cast5_generic cast_common deflate sha512_ssse3 sha512_generic cfb ofb serpent_sse2_x86_64 serpent_generic lrw twofish_x86_64_3way twofish_x86_64 crypto_simd cryptd glue_helper twofish_generic twofish_common blowfish_x86_64 blowfish_generic blowfish_common md4 tcrypt(+)
> [  112.797652] ---[ end trace 4a8142d4a08c2518 ]---
> [  112.798320] RIP: 0010:sg_next+0x0/0x20
> [  112.798865] Code: cc cc cc cc cc cc cc cc cc cc c7 47 10 00 00 00 00 89 57 0c 48 89 37 89 4f 08 c3 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 <f6> 07 02 75 17 48 8b 57 20 48 8d 47 20 48 89 d1 48 83 e1 fc 83 e2
> [  112.801452] RSP: 0018:ffffa92440237d90 EFLAGS: 00010006
> [  112.802189] RAX: fefefefe00000000 RBX: 000000000000000a RCX: fefefefe00000000
> [  112.803190] RDX: 0000000000000001 RSI: ffff9b19da1a2180 RDI: fefefefe00000000
> [  112.804192] RBP: ffff9b19da1a2198 R08: ffff9b19dfb24ee8 R09: 0000000000000a20
> [  112.805201] R10: ffff9b19da125010 R11: 0000000000000000 R12: ffff9b19da1a21b8
> [  112.806195] R13: 0000000000000003 R14: ffff9b19da1a2180 R15: 0000000000000004
> [  112.807222] FS:  0000000000000000(0000) GS:ffff9b19de400000(0000) knlGS:0000000000000000
> [  112.808352] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  112.809169] CR2: 00007f18a157b050 CR3: 000000001040a004 CR4: 0000000000060ef0
> 
> I have tested also 5.4.14 
> and I got random freeze with:
> qemu-system-x86_64: virtio: zero sized buffers are not allowed
> 
> Regards

Cc: Gonglei <arei.gonglei@huawei.com>

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
