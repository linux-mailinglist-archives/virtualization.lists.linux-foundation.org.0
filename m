Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B834BD9D1
	for <lists.virtualization@lfdr.de>; Mon, 21 Feb 2022 14:12:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C81360E25;
	Mon, 21 Feb 2022 13:12:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q8neR86Si8Sf; Mon, 21 Feb 2022 13:12:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4B2A360E21;
	Mon, 21 Feb 2022 13:12:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B83EAC0036;
	Mon, 21 Feb 2022 13:12:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EBCA8C0011
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Feb 2022 13:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1DEB81839
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Feb 2022 13:12:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hdWxbMpNAkqg
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Feb 2022 13:12:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF36981815
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Feb 2022 13:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645449164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ppzDXyf5qUdHu/qahqx1jXO12LO18Enabwf41mMpCt8=;
 b=IOwk5MKe9kIOVB+csNMhUi441rxnrpuchtH0lJ6pgoJ3hfaAWxr8HqO+o9c98blavp2H7Z
 Cblf/39v+KhQOEqIS+1hyV7AKnr21DOsYOT1tJRpwR4MPI5cpgImWe9TAUWVhz7egZghlc
 qrCroY2XNNgF9i8DhSBHPkNGTpaBCXQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-94-bZM7xglHP2u7A908SzxhZw-1; Mon, 21 Feb 2022 08:12:41 -0500
X-MC-Unique: bZM7xglHP2u7A908SzxhZw-1
Received: by mail-wr1-f71.google.com with SMTP id
 q21-20020adfab15000000b001e57c9a342aso7393116wrc.6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Feb 2022 05:12:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ppzDXyf5qUdHu/qahqx1jXO12LO18Enabwf41mMpCt8=;
 b=o3/AjYvUMR3pupa3ZfFBxOA106nall9rNz3WpJgVLh2FRspYf2VsOgPP3sM7DxTM2E
 mf9+hSUhbUS9C13WdnxqZ2V9qjExaJfh+im9QhMAUtW36PPubh+4BenviXTmzDehUyoR
 g/7Y/TWb5tsJkBvoq9PBJxH1xkhCDeoE1NLNrOWs523AK2EelWAoT1NiAeVcVpiKNv6Q
 /odmqjYVQuMkFs4drcG/5Yt6gYajgdTxaqbekMAO+RIOuSbZ1l0i/7JIghmj/xxoaXFF
 HUNor80EdiyRleLZWaJF5meR/1iMe2vD9UqOjE9SSvyqxZAScArhqrI8df9fF1bHHcNy
 TeWQ==
X-Gm-Message-State: AOAM533ODTEQbmLtXwe6pv88fTkgIu6t9n+KlTMy2VyvtxtVVLd8eP2q
 XeM47EiOywyGDaAIeV1JbJq61wQMUDqhfn/XI8+A0KmLejA1g9FHCMQ0zsDN7tqq20yt/MOGzFT
 2JWcxClsrYho+KMf26lMuYlI5ewA56TLGyW3Di6+A5Q==
X-Received: by 2002:a5d:46d2:0:b0:1e4:a653:e010 with SMTP id
 g18-20020a5d46d2000000b001e4a653e010mr16634540wrs.77.1645449160023; 
 Mon, 21 Feb 2022 05:12:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzU8ZEgdy82UVhvG2xdvSW8GSdGfZpb0TmrUMBvl4ZKTzAJyuQlzFVef+h5XXvOG89RBX1XXA==
X-Received: by 2002:a5d:46d2:0:b0:1e4:a653:e010 with SMTP id
 g18-20020a5d46d2000000b001e4a653e010mr16634524wrs.77.1645449159811; 
 Mon, 21 Feb 2022 05:12:39 -0800 (PST)
Received: from sgarzare-redhat (host-95-248-229-156.retail.telecomitalia.it.
 [95.248.229.156])
 by smtp.gmail.com with ESMTPSA id f7sm43525089wrz.40.2022.02.21.05.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 05:12:39 -0800 (PST)
Date: Mon, 21 Feb 2022 14:12:36 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: syzbot <syzbot+bbb030fc51d6f3c5d067@syzkaller.appspotmail.com>
Subject: Re: [syzbot] general protection fault in vhost_iotlb_itree_first
Message-ID: <20220221131236.ekihumv67fpsjsoq@sgarzare-redhat>
References: <0000000000003d82b405d85b7be9@google.com>
MIME-Version: 1.0
In-Reply-To: <0000000000003d82b405d85b7be9@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

#syz test: https://github.com/stefano-garzarella/linux.git vsock-fix-stop

On Sat, Feb 19, 2022 at 01:18:24AM -0800, syzbot wrote:
>Hello,
>
>syzbot found the following issue on:
>
>HEAD commit:    359303076163 tty: n_tty: do not look ahead for EOL charact..
>git tree:       upstream
>console output: https://syzkaller.appspot.com/x/log.txt?x=16b34b54700000
>kernel config:  https://syzkaller.appspot.com/x/.config?x=da674567f7b6043d
>dashboard link: https://syzkaller.appspot.com/bug?extid=bbb030fc51d6f3c5d067
>compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
>
>Unfortunately, I don't have any reproducer for this issue yet.
>
>IMPORTANT: if you fix the issue, please add the following tag to the commit:
>Reported-by: syzbot+bbb030fc51d6f3c5d067@syzkaller.appspotmail.com
>
>general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN
>KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
>CPU: 1 PID: 17981 Comm: vhost-17980 Not tainted 5.17.0-rc4-syzkaller-00052-g359303076163 #0
>Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
>RIP: 0010:vhost_iotlb_itree_iter_first drivers/vhost/iotlb.c:19 [inline]
>RIP: 0010:vhost_iotlb_itree_first+0x29/0x280 drivers/vhost/iotlb.c:169
>Code: 00 41 57 41 56 41 55 49 89 d5 41 54 55 48 89 fd 53 48 89 f3 e8 e8 eb a0 fa 48 89 ea 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <80> 3c 02 00 0f 85 e8 01 00 00 4c 8b 65 00 4d 85 e4 0f 84 b3 01 00
>RSP: 0018:ffffc90004f57ac8 EFLAGS: 00010246
>RAX: dffffc0000000000 RBX: 30303030320a0028 RCX: ffffc900103dc000
>RDX: 0000000000000000 RSI: ffffffff86d72738 RDI: 0000000000000000
>RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000002
>R10: ffffffff86d62d88 R11: 0000000000000000 R12: ffff8880260e4d68
>R13: 303030305f3a3057 R14: dffffc0000000000 R15: 0000000000000000
>FS:  0000000000000000(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
>CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>CR2: 00007f2d46121901 CR3: 000000001d652000 CR4: 00000000003506e0
>DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>Call Trace:
> <TASK>
> translate_desc+0x11e/0x3e0 drivers/vhost/vhost.c:2054
> vhost_get_vq_desc+0x662/0x22c0 drivers/vhost/vhost.c:2300
> vhost_vsock_handle_tx_kick+0x277/0xa20 drivers/vhost/vsock.c:522
> vhost_worker+0x23d/0x3d0 drivers/vhost/vhost.c:372
> kthread+0x2e9/0x3a0 kernel/kthread.c:377
> ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
> </TASK>
>Modules linked in:
>---[ end trace 0000000000000000 ]---
>RIP: 0010:vhost_iotlb_itree_iter_first drivers/vhost/iotlb.c:19 [inline]
>RIP: 0010:vhost_iotlb_itree_first+0x29/0x280 drivers/vhost/iotlb.c:169
>Code: 00 41 57 41 56 41 55 49 89 d5 41 54 55 48 89 fd 53 48 89 f3 e8 e8 eb a0 fa 48 89 ea 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <80> 3c 02 00 0f 85 e8 01 00 00 4c 8b 65 00 4d 85 e4 0f 84 b3 01 00
>RSP: 0018:ffffc90004f57ac8 EFLAGS: 00010246
>RAX: dffffc0000000000 RBX: 30303030320a0028 RCX: ffffc900103dc000
>RDX: 0000000000000000 RSI: ffffffff86d72738 RDI: 0000000000000000
>RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000002
>R10: ffffffff86d62d88 R11: 0000000000000000 R12: ffff8880260e4d68
>R13: 303030305f3a3057 R14: dffffc0000000000 R15: 0000000000000000
>FS:  0000000000000000(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
>CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>CR2: 00007f2d449f6718 CR3: 000000001d652000 CR4: 00000000003506e0
>DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>----------------
>Code disassembly (best guess):
>   0:	00 41 57             	add    %al,0x57(%rcx)
>   3:	41 56                	push   %r14
>   5:	41 55                	push   %r13
>   7:	49 89 d5             	mov    %rdx,%r13
>   a:	41 54                	push   %r12
>   c:	55                   	push   %rbp
>   d:	48 89 fd             	mov    %rdi,%rbp
>  10:	53                   	push   %rbx
>  11:	48 89 f3             	mov    %rsi,%rbx
>  14:	e8 e8 eb a0 fa       	callq  0xfaa0ec01
>  19:	48 89 ea             	mov    %rbp,%rdx
>  1c:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
>  23:	fc ff df
>  26:	48 c1 ea 03          	shr    $0x3,%rdx
>* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
>  2e:	0f 85 e8 01 00 00    	jne    0x21c
>  34:	4c 8b 65 00          	mov    0x0(%rbp),%r12
>  38:	4d 85 e4             	test   %r12,%r12
>  3b:	0f                   	.byte 0xf
>  3c:	84                   	.byte 0x84
>  3d:	b3 01                	mov    $0x1,%bl
>
>
>---
>This report is generated by a bot. It may contain errors.
>See https://goo.gl/tpsmEJ for more information about syzbot.
>syzbot engineers can be reached at syzkaller@googlegroups.com.
>
>syzbot will keep track of this issue. See:
>https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
