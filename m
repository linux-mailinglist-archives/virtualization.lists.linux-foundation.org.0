Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1BC73758
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:07:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E3F9E1434;
	Wed, 24 Jul 2019 18:59:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A87151C3B
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 18:19:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 00BF770D
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 18:19:01 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v19so2046605wmj.5
	for <virtualization@lists.linux-foundation.org>;
	Tue, 02 Jul 2019 11:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:content-transfer-encoding:in-reply-to:references
	:subject:cc:from:to:message-id:user-agent:date;
	bh=hEU9uNz0FeGZ4kxd0wEk8UwwTQ62JJQ9s9qQBcddhu8=;
	b=esnMLw+keGA9XQ1HnEGydaI33kpqF5YM1dm7n0bfiBl9pmdyO8Rpf2wVb2Q0LyQAG6
	ojJP0je2Mn4GBBA1POXJM/7B+f1QTkpFQHBd5sxMqR3wKlM+/5QlIKQH+P5LDEuubdCw
	qCUgX6AJAJtnBqcUd+FCwkV5HyrzK3Z0PFgxi16Vv02uYkHTu8KC/GWSZE7wAbc2vn4T
	mAwkchonzA8mVk5QG0XZ+BbJWuyUlQWyGVuaAm4I1q2rVtBLq4SKeIGmvV/yHqG+hize
	5jKrejWvpx27Nyas5LRbgWflefO2/1+BejN4ydwX/yjbJuwptj5ro1k4cbKucCByCuZg
	sqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:content-transfer-encoding
	:in-reply-to:references:subject:cc:from:to:message-id:user-agent
	:date;
	bh=hEU9uNz0FeGZ4kxd0wEk8UwwTQ62JJQ9s9qQBcddhu8=;
	b=g34r+7pr9ugy2mecS8nj61uFaCdJWKiGB8YVPPu2Je24dLhGChxeuke087BN28gvjF
	Uperv2wq3ArXkY+9hO1vFwh/uSXwdUB84C7//dv/chaI20tjGJozzelZwOdYTjYyuSFf
	ivsn5LFPz0T52ktx1VOBxpKwBnMwVo41fDB7sYu1rQW3nBt+NHvdfolpFJGHgHXUTN2/
	/aWIKZK+aOOHlGEHw3du9MJ201u9HImKycFmQumY8n1yy+3TaE4gqA2dpIUgSxefM5qH
	JwfmwzilVZ8UhriByfWwsNX7tEnW85KFGoqn7oCg+QTByY+PKJLQQFmCLD6O1S2arGiA
	RJiA==
X-Gm-Message-State: APjAAAWY6/WivCECEvicafPKav82OYOD/JlzfSiN2htroxHh/+KpdeZK
	4YpJ5CR1oEfA9kqfjL1Uw40=
X-Google-Smtp-Source: APXvYqw5bkzt/DpFLQmrKZqj9GKK+Oiol3+jSArs3mFrvRB2JmQZAOboaUNt0oDpWHQ0ot8Pzea0Hw==
X-Received: by 2002:a05:600c:2243:: with SMTP id
	a3mr4150010wmm.83.1562091540477; 
	Tue, 02 Jul 2019 11:19:00 -0700 (PDT)
Received: from localhost ([151.237.18.226])
	by smtp.gmail.com with ESMTPSA id f7sm3496945wrp.55.2019.07.02.11.18.59
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 02 Jul 2019 11:18:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20190702144818.32648-1-ihor.matushchak@foobox.net>
References: <156207429000.5051.5975712347598980745@silver>
	<20190702144818.32648-1-ihor.matushchak@foobox.net>
Subject: Re: [PATCH v2] virtio-mmio: add error check for platform_get_irq
From: "Ivan T. Ivanov" <iivanov.xz@gmail.com>
To: Ihor Matushchak <ihor.matushchak@foobox.net>, mst@redhat.com
Message-ID: <156209153842.6607.13027564854773685120@silver>
User-Agent: alot/0.8.1
Date: Tue, 02 Jul 2019 21:18:58 +0300
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Wed, 24 Jul 2019 18:59:23 +0000
Cc: ihor.matushchak@foobox.net, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Quoting Ihor Matushchak (2019-07-02 17:48:18)
> in vm_find_vqs() irq has a wrong type
> so, in case of no IRQ resource defined,
> wrong parameter will be passed to request_irq()
> 
> Signed-off-by: Ihor Matushchak <ihor.matushchak@foobox.net>


Reviewed-by: Ivan T. Ivanov <iivanov.xz@gmail.com>

Thanks!

> ---
> Changes in v2:
> Don't overwrite error code value.
> 
>  drivers/virtio/virtio_mmio.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
> index f363fbeb5ab0..e09edb5c5e06 100644
> --- a/drivers/virtio/virtio_mmio.c
> +++ b/drivers/virtio/virtio_mmio.c
> @@ -463,9 +463,14 @@ static int vm_find_vqs(struct virtio_device *vdev, unsigned nvqs,
>                        struct irq_affinity *desc)
>  {
>         struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vdev);
> -       unsigned int irq = platform_get_irq(vm_dev->pdev, 0);
> +       int irq = platform_get_irq(vm_dev->pdev, 0);
>         int i, err, queue_idx = 0;
>  
> +       if (irq < 0) {
> +               dev_err(&vdev->dev, "Cannot get IRQ resource\n");
> +               return irq;
> +       }
> +
>         err = request_irq(irq, vm_interrupt, IRQF_SHARED,
>                         dev_name(&vdev->dev), vm_dev);
>         if (err)
> -- 
> 2.17.1
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
