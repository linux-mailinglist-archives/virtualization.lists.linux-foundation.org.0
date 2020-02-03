Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBFD1512A6
	for <lists.virtualization@lfdr.de>; Tue,  4 Feb 2020 00:02:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2272F844A5;
	Mon,  3 Feb 2020 23:02:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zOPZQsfPNC6J; Mon,  3 Feb 2020 23:02:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F366A84452;
	Mon,  3 Feb 2020 23:02:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB737C0174;
	Mon,  3 Feb 2020 23:02:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12F1FC0174
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Feb 2020 23:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0A63D84B96
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Feb 2020 23:02:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iIGZki4wtm9f
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Feb 2020 23:02:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D590C84791
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Feb 2020 23:02:09 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a5so1159637wmb.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 03 Feb 2020 15:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UQrCAS6YzzfKPGlDrBdTZKsdD8tSKug6buwMECwlOC0=;
 b=iOoz1NkT5AG/LWxmRvwmFDV0IjGt+NcByoc3+DMDHCkHhXSVzruy3FUxSDaCys24Sy
 sBhyTy5H9ovpv1Ynts1T3tkuHfcBYtm2iuaJY9K2Gormo7niVEgQsj+jvD0NmjAq1B6w
 OQNVGIBO7najlWkKIvYoURumQw039g1zpeHjIMfXlwhizF7z5XqXen47zi9nwZfJn0n7
 ySICCUUdqOUO4qX2Rl7DkBxdje3v1OkovDOum2RMOHrXhK7LLj74O6TcAPhCs7DQSLnD
 kr3IUuvGth+vx5LFJwrOCQtNIGyMrhDgaCnuMKRlOzxc5qvgf8yg8jU9X2o13ZaVw8eq
 tt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UQrCAS6YzzfKPGlDrBdTZKsdD8tSKug6buwMECwlOC0=;
 b=LrauFafAZU6eUfelZKjStUJFxr7fNEAELCoGxc2cjy29LkwgftTlWW8uPYn/GizxTa
 G8H5OR6pT6il745qq1XO5Jb8KA3ydv+xG4kD9RwRaBZuop5f1LD9Y8J84G87KIRxktRs
 uXFIkItwJnb79Eq54ng5lzYC5BSZnrQ1pFo88Zh6VAerZz7B8sDdTj8RmVfwac0rtOCS
 U6XXkAOAj/AK56KaDaZugzzhlm2UA1REGhzrvPqNiLpon/Dm5/nWj5qJj50ginT49cDS
 siIaNWrCFzET4aUeMjjhY9FL6AxAiKo49OoYRATCi8tesjynieG8mGxMyIDz7TrhdVkL
 f6gw==
X-Gm-Message-State: APjAAAVays9QwtXkpCMfaX/+sXfP7OXflIvfDOEdlxEtZ7hpuFL77Nhz
 XPdXtjVWXEUe68vEe+yFeyTX3Ay3SyDJVpGFEz5aLg==
X-Google-Smtp-Source: APXvYqwKFQfnEp6Ah71z2pwfFDSCKVZGoG0LuCaYPOUsiBDRxDuBdUAJCZyANdgxKKrded9LIBipXnLJ9KV6Hc0ws/Y=
X-Received: by 2002:a1c:b603:: with SMTP id g3mr1366806wmf.133.1580770928066; 
 Mon, 03 Feb 2020 15:02:08 -0800 (PST)
MIME-Version: 1.0
References: <20200123101000.GB24255@Red>
 <20200123065150-mutt-send-email-mst@kernel.org>
 <20200203205324.GA26330@Red>
In-Reply-To: <20200203205324.GA26330@Red>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Mon, 3 Feb 2020 23:01:57 +0000
Message-ID: <CAKv+Gu8zPK2R_3UbGJq=+g=exknY0g2cprKBgBUTMKAPXL=pOA@mail.gmail.com>
Subject: Re: [CRASH] crypto: virtio: crash when modprobing tcrypt on 5.5-rc7 /
 next-20200122
To: LABBE Corentin <clabbe@baylibre.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, virtualization@lists.linux-foundation.org,
 "David S. Miller" <davem@davemloft.net>
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

On Mon, 3 Feb 2020 at 20:53, LABBE Corentin <clabbe@baylibre.com> wrote:
>
> On Thu, Jan 23, 2020 at 06:52:29AM -0500, Michael S. Tsirkin wrote:
> > On Thu, Jan 23, 2020 at 11:10:00AM +0100, LABBE Corentin wrote:
> > > Hello
> > >
> > > When modprobing tcrypt on qemu 4.1.0 I get a kernel panic on 5.5-rc7 and next-20200122
> > > qemu is started by:
> > > /usr/bin/qemu-system-x86_64 -cpu host -enable-kvm -nographic -net nic,model=e1000,macaddr=52:54:00:12:34:58 -net tap -m 512 -monitor none -object cryptodev-backend-builtin,id=cryptodev0 -device virtio-crypto-pci,id=crypto0,cryptodev=cryptodev0 -append 'console=ttyS0 root=/dev/ram0 ip=dhcp' -kernel /var/lib/lava/dispatcher/tmp/41332/deployimages-td18675m/kernel/bzImage -initrd /var/lib/lava/dispatcher/tmp/41332/deployimages-td18675m/ramdisk/rootfs.cpio.gz -drive format=qcow2,file=/var/lib/lava/dispatcher/tmp/41332/apply-overlay-guest-icy4k1ol/lava-guest.qcow2,media=disk,if=ide,id=lavatest
> > >
> > > [  112.771925] general protection fault: 0000 [#1] SMP PTI
> > > [  112.772686] CPU: 0 PID: 126 Comm: virtio0-engine Not tainted 5.5.0-rc7+ #1
> > > [  112.773576] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS ?-20190711_202441-buildvm-armv7-10.arm.fedoraproject.org-2.fc31 04/01/2014

Interesting. So your QEMU was cross-built on an ARMv7 machine?? Or
just the guest firmware?


> > > [  112.775319] RIP: 0010:sg_next+0x0/0x20
> > > [  112.775821] Code: cc cc cc cc cc cc cc cc cc cc c7 47 10 00 00 00 00 89 57 0c 48 89 37 89 4f 08 c3 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 <f6> 07 02 75 17 48 8b 57 20 48 8d 47 20 48 89 d1 48 83 e1 fc 83 e2
> > > [  112.778330] RSP: 0018:ffffa92440237d90 EFLAGS: 00010006
> > > [  112.779071] RAX: fefefefe00000000 RBX: 000000000000000a RCX: fefefefe00000000
> > > [  112.780081] RDX: 0000000000000001 RSI: ffff9b19da1a2180 RDI: fefefefe00000000
> > > [  112.781081] RBP: ffff9b19da1a2198 R08: ffff9b19dfb24ee8 R09: 0000000000000a20
> > > [  112.782079] R10: ffff9b19da125010 R11: 0000000000000000 R12: ffff9b19da1a21b8
> > > [  112.783079] R13: 0000000000000003 R14: ffff9b19da1a2180 R15: 0000000000000004
> > > [  112.784077] FS:  0000000000000000(0000) GS:ffff9b19de400000(0000) knlGS:0000000000000000
> > > [  112.785202] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [  112.786030] CR2: 00007f18a157b050 CR3: 000000001040a004 CR4: 0000000000060ef0
> > > [  112.787034] Call Trace:
> > > [  112.787393]  virtqueue_add_sgs+0x4c/0x90
> > > [  112.787998]  virtio_crypto_skcipher_crypt_req+0x310/0x3e0
> > > [  112.788817]  crypto_pump_work+0x10c/0x240
> > > [  112.789420]  ? __kthread_init_worker+0x50/0x50
> > > [  112.790082]  kthread_worker_fn+0x89/0x180
> > > [  112.790690]  kthread+0x10e/0x130
> > > [  112.791182]  ? kthread_park+0x80/0x80
> > > [  112.791736]  ret_from_fork+0x35/0x40
> > > [  112.792282] Modules linked in: cts lzo salsa20_generic camellia_x86_64 camellia_generic fcrypt pcbc tgr192 anubis wp512 khazad tea michael_mic arc4 cast6_generic cast5_generic cast_common deflate sha512_ssse3 sha512_generic cfb ofb serpent_sse2_x86_64 serpent_generic lrw twofish_x86_64_3way twofish_x86_64 crypto_simd cryptd glue_helper twofish_generic twofish_common blowfish_x86_64 blowfish_generic blowfish_common md4 tcrypt(+)
> > > [  112.797652] ---[ end trace 4a8142d4a08c2518 ]---
> > > [  112.798320] RIP: 0010:sg_next+0x0/0x20
> > > [  112.798865] Code: cc cc cc cc cc cc cc cc cc cc c7 47 10 00 00 00 00 89 57 0c 48 89 37 89 4f 08 c3 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 <f6> 07 02 75 17 48 8b 57 20 48 8d 47 20 48 89 d1 48 83 e1 fc 83 e2
> > > [  112.801452] RSP: 0018:ffffa92440237d90 EFLAGS: 00010006
> > > [  112.802189] RAX: fefefefe00000000 RBX: 000000000000000a RCX: fefefefe00000000
> > > [  112.803190] RDX: 0000000000000001 RSI: ffff9b19da1a2180 RDI: fefefefe00000000
> > > [  112.804192] RBP: ffff9b19da1a2198 R08: ffff9b19dfb24ee8 R09: 0000000000000a20
> > > [  112.805201] R10: ffff9b19da125010 R11: 0000000000000000 R12: ffff9b19da1a21b8
> > > [  112.806195] R13: 0000000000000003 R14: ffff9b19da1a2180 R15: 0000000000000004
> > > [  112.807222] FS:  0000000000000000(0000) GS:ffff9b19de400000(0000) knlGS:0000000000000000
> > > [  112.808352] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [  112.809169] CR2: 00007f18a157b050 CR3: 000000001040a004 CR4: 0000000000060ef0
> > >
> > > I have tested also 5.4.14
> > > and I got random freeze with:
> > > qemu-system-x86_64: virtio: zero sized buffers are not allowed
> > >
> > > Regards
> >
> > did any of previous versions work for you?
> > Any chance of a bisect?
> >
>
> Hello
>
> Bisecting lead to 500e6807ce93b1fdc7d5b827c5cc167cc35630db ("crypto: virtio - implement missing support for output IVs")
> Qemu 4.2.0 also fail like this but not 1:3.1+dfsg-8+deb10u2
>

That commit adds scatterwalk_map_and_copy() calls in two places, and
the only way I see that could cause corruption here is when
req->cryptlen < AES_BLOCK_SIZE.

Could you please try whether returning an error early in
__virtio_crypto_skcipher_do_req() if req->cryptlen < AES_BLOCK_SIZE
fixes the issue?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
