Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA32146742
	for <lists.virtualization@lfdr.de>; Thu, 23 Jan 2020 12:52:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 324DA868C0;
	Thu, 23 Jan 2020 11:52:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VRI9n0vhDlfJ; Thu, 23 Jan 2020 11:52:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8429286930;
	Thu, 23 Jan 2020 11:52:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D2D5C0174;
	Thu, 23 Jan 2020 11:52:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96C70C0174
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jan 2020 11:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 84851875BA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jan 2020 11:52:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KfZW6EoA7f1s
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jan 2020 11:52:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 78B7B839C1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jan 2020 11:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579780356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=InTGFoFr4K0JH5iJeKl7FcrQzJzUete0v0UfYk0ekVs=;
 b=d5l2kWvAvzAgiLfXysKjiO1q2zdbDv53QejJ+Xak4sFlHtD5CTXYe8JOhG6vUVoYwf9HSX
 Nj5gcrWQk0AQfm++XQCTQDN03n9Q47QaBRXCb19NeKP1yZyqo1CHx8PQgPHsbCKEfMuhFy
 NvcnMmENg0qvVQ+0n40BGYNEYQhMGIw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-Y06ufjOeNoakFPxF6Wtglw-1; Thu, 23 Jan 2020 06:52:35 -0500
Received: by mail-wr1-f70.google.com with SMTP id h30so1595007wrh.5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jan 2020 03:52:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=InTGFoFr4K0JH5iJeKl7FcrQzJzUete0v0UfYk0ekVs=;
 b=ADEfmLtE0A1CTyy5iQS404AwNyrMRZzwtRx/g6HL/FNg85HfY6//nF4R3D9vVAuXMV
 cWpCIiZ3D/85/4Krk+5gKzq07Ir9fNh8ReRf4b//3KzXmi3LlXbvVxw+bMOYPnQmBz/v
 qN4ep7VuwB445tg87ecW6Fh2yuMgxtT+WKkGUJXqBAz2LH48xP/SQ94K0gMrPErABY36
 ynZ1jlMC4ziaE+d9UiI9Mri4hmxxmsJupwfRyYTnUtHeVt4YF+ek5faUxU3Cnd4/1+aH
 8ZMRoQwsjsLElpGJO6ohPbX7QsbDNa4K6v/zuYZVpB8/CeWbZz1nam+GIrYXsgun53wt
 XOVg==
X-Gm-Message-State: APjAAAVyV1MlykO3zR+VWMmoHExBGfNjrMJlGmpZwxEiPpgF+5p19TKC
 xZ/vFefTgxVsgh0BT2HMVJtoD9X9P5Eb6ixKk/uUnAWK3OJO6406hjAa5edp8sM+V92P12RKixq
 2XMr3gSHWix7IiICVtblaomYoxJh7eAqJLzCPfquhMw==
X-Received: by 2002:adf:82a7:: with SMTP id 36mr17569552wrc.203.1579780353363; 
 Thu, 23 Jan 2020 03:52:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqz5O2ZqEQVqQn32hTKvSwhWMEEvVB7a4Div4tqNA/qDlS49TvRgqkmhE+r7V5GWwO3fPdE5RA==
X-Received: by 2002:adf:82a7:: with SMTP id 36mr17569535wrc.203.1579780353079; 
 Thu, 23 Jan 2020 03:52:33 -0800 (PST)
Received: from redhat.com (bzq-79-176-0-156.red.bezeqint.net. [79.176.0.156])
 by smtp.gmail.com with ESMTPSA id
 a9sm2320787wmm.15.2020.01.23.03.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 03:52:32 -0800 (PST)
Date: Thu, 23 Jan 2020 06:52:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: LABBE Corentin <clabbe@baylibre.com>
Subject: Re: [CRASH] crypto: virtio: crash when modprobing tcrypt on 5.5-rc7
 / next-20200122
Message-ID: <20200123065150-mutt-send-email-mst@kernel.org>
References: <20200123101000.GB24255@Red>
MIME-Version: 1.0
In-Reply-To: <20200123101000.GB24255@Red>
X-MC-Unique: Y06ufjOeNoakFPxF6Wtglw-1
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

did any of previous versions work for you?
Any chance of a bisect?

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
