Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B1D4DBD93
	for <lists.virtualization@lfdr.de>; Thu, 17 Mar 2022 04:26:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 729EC84760;
	Thu, 17 Mar 2022 03:26:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nGQGck0cb31C; Thu, 17 Mar 2022 03:26:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 25AA58475F;
	Thu, 17 Mar 2022 03:26:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0ED9C0033;
	Thu, 17 Mar 2022 03:26:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 497E5C000B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Mar 2022 03:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37F144179F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Mar 2022 03:26:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 88C6AYucxZjg
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Mar 2022 03:26:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 636824179A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Mar 2022 03:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647487599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VdUR6nzOC/8O0v+PINEYQA8hLCMnHSUIAPMWwkW08rs=;
 b=Wyfm3m60PtMDs9J980olZsBlkeVIRdwuebiXZVqR/xCw2kGY60wv6+aE80qaAaiMFwEGDM
 7YRqS4nHgBrBPJ+pBHMKwcrRNiUoG52KtSnMdK0lsMRTr0fNEcoYGSXhHXgyBofffJUzFa
 tIGbVspPUaqcrKVF86iqziLojiuccKA=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-PxnU4jONOlSu3nBoCBt9LA-1; Wed, 16 Mar 2022 23:26:37 -0400
X-MC-Unique: PxnU4jONOlSu3nBoCBt9LA-1
Received: by mail-lj1-f198.google.com with SMTP id
 20-20020a2e0914000000b0024635d136ddso1596761ljj.22
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Mar 2022 20:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VdUR6nzOC/8O0v+PINEYQA8hLCMnHSUIAPMWwkW08rs=;
 b=UX3P2fVrEa20pLQ9Yr3ZXdug/Oe879L/cObyXuoIlY5v7iccyHpatxXYSAgz+aHVPI
 HAW6nmdgLCegKZHsXjDOaHTn0F9vgqRMDWzFN1zV44SKcaZEsxKFgj0B2JifoLwVa1ke
 2Y/C3rl5r/8XQyuidOPwE5FTQ8miCc7qO3EZ42YrT575+uMfQ0A+vQSDUWInsGQOq7/m
 Qo130XPH1WhwxvskCgkcZHgdCs77OZU5MyoD39IBQce3ov99pCQyIl3253PnhpVFQKmz
 nX0Zlu7pwF03GmdoOR+0tU3qEcwEwE83kfh6ctz+uQl4r7KGVPH3B4/74QvinzDPWKz8
 rDew==
X-Gm-Message-State: AOAM5339VDuVUS1z3hJIZk/CBBtEZohXQ7XesH16h0m5RaLesA7eIH0d
 3PV4otxWdpl7kDpJQWZLCv8eYCa9eOZI9RrFYeHZoXrFvXi2Ny5mXYQHKEgoXq9eNauBE4cDGiZ
 +ozYSO2nDmLP1+7HzzcwlJp2N8mzNoyLFxA/M4eZMqHu9HqkNzOsOPYwcrg==
X-Received: by 2002:a2e:a490:0:b0:248:8f0:e4ee with SMTP id
 h16-20020a2ea490000000b0024808f0e4eemr1585848lji.97.1647487596267; 
 Wed, 16 Mar 2022 20:26:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxodJS4+oPuUw6/FJlLdS1DOlRDugHlSvT6drTv1PuTs0XvDj5DTLTyLGxZOhq4kq4IHrWqpfNVV0chS1q08S4=
X-Received: by 2002:a2e:a490:0:b0:248:8f0:e4ee with SMTP id
 h16-20020a2ea490000000b0024808f0e4eemr1585821lji.97.1647487596075; Wed, 16
 Mar 2022 20:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220316192010.19001-1-rdunlap@infradead.org>
 <20220316192010.19001-2-rdunlap@infradead.org>
In-Reply-To: <20220316192010.19001-2-rdunlap@infradead.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 17 Mar 2022 11:26:24 +0800
Message-ID: <CACGkMEtg6uCNfP-ncXEEWn+EeGLe1-KxbYu45g1-7vR_JHr7hg@mail.gmail.com>
Subject: Re: [PATCH 1/9] virtio_blk: eliminate anonymous module_init &
 module_exit
To: Randy Dunlap <rdunlap@infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: the arch/x86 maintainers <x86@kernel.org>,
 Andy Lutomirski <luto@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, nouveau@lists.freedesktop.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Valentina Manea <valentina.manea.m@gmail.com>,
 Karol Herbst <karolherbst@gmail.com>,
 Krzysztof Opasiak <k.opasiak@samsung.com>, Eli Cohen <eli@mellanox.com>,
 netdev <netdev@vger.kernel.org>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, Leon Romanovsky <leon@kernel.org>,
 RDMA mailing list <linux-rdma@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, coreteam@netfilter.org,
 Jakub Kicinski <kuba@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Joachim Fritschi <jfritschi@freenet.de>,
 Felipe Balbi <felipe.balbi@linux.intel.com>, Amit Shah <amit@kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 linux-block@vger.kernel.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Jussi Kivilinna <jussi.kivilinna@mbnet.fi>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jens Axboe <axboe@kernel.dk>,
 linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Florian Westphal <fw@strlen.de>, linux-kernel <linux-kernel@vger.kernel.org>,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Igor Kotrasinski <i.kotrasinsk@samsung.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
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

On Thu, Mar 17, 2022 at 3:25 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Eliminate anonymous module_init() and module_exit(), which can lead to
> confusion or ambiguity when reading System.map, crashes/oops/bugs,
> or an initcall_debug log.
>
> Give each of these init and exit functions unique driver-specific
> names to eliminate the anonymous names.
>
> Example 1: (System.map)
>  ffffffff832fc78c t init
>  ffffffff832fc79e t init
>  ffffffff832fc8f8 t init
>
> Example 2: (initcall_debug log)
>  calling  init+0x0/0x12 @ 1
>  initcall init+0x0/0x12 returned 0 after 15 usecs
>  calling  init+0x0/0x60 @ 1
>  initcall init+0x0/0x60 returned 0 after 2 usecs
>  calling  init+0x0/0x9a @ 1
>  initcall init+0x0/0x9a returned 0 after 74 usecs
>
> Fixes: e467cde23818 ("Block driver using virtio.")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: virtualization@lists.linux-foundation.org
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: linux-block@vger.kernel.org
> ---

Acked-by: Jason Wang <jasowang@redhat.com>

>  drivers/block/virtio_blk.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> --- lnx-517-rc8.orig/drivers/block/virtio_blk.c
> +++ lnx-517-rc8/drivers/block/virtio_blk.c
> @@ -1058,7 +1058,7 @@ static struct virtio_driver virtio_blk =
>  #endif
>  };
>
> -static int __init init(void)
> +static int __init virtio_blk_init(void)
>  {
>         int error;
>
> @@ -1084,14 +1084,14 @@ out_destroy_workqueue:
>         return error;
>  }
>
> -static void __exit fini(void)
> +static void __exit virtio_blk_fini(void)
>  {
>         unregister_virtio_driver(&virtio_blk);
>         unregister_blkdev(major, "virtblk");
>         destroy_workqueue(virtblk_wq);
>  }
> -module_init(init);
> -module_exit(fini);
> +module_init(virtio_blk_init);
> +module_exit(virtio_blk_fini);
>
>  MODULE_DEVICE_TABLE(virtio, id_table);
>  MODULE_DESCRIPTION("Virtio block driver");
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
