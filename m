Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8B173756
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:07:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7396714F3;
	Wed, 24 Jul 2019 18:59:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B88791AED
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 13:31:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 44E0A84F
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 13:31:33 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n9so17896103wru.0
	for <virtualization@lists.linux-foundation.org>;
	Tue, 02 Jul 2019 06:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:content-transfer-encoding:in-reply-to:references
	:subject:from:to:cc:message-id:user-agent:date;
	bh=4VPnLBfnP+yE8XWhPk6Z0NZmIvwwW0UIFWDe0blP3PA=;
	b=SSHIWLXSCz2J4XKgqcuB4HuhMgP+BgSjUvlvTI1SfIECDv8eAnmm7cP4x6cRFpdbRd
	e+z2Qtim/Mny+j7W4rH6z1xj4EWXisZqMg5DdWH/AVWl1rbE26SK5Ern1cohCsDP/qBE
	/SYTm60q5UUSpE5YlgVQciF57ibUm+YAddrQEFsjiS3BSooSXp/9lfufr4CgL6tRF+vM
	qShTZpZ847UuD/66QU6Dt84odNmrjud0aJrMXVondjAUKB4QHvPBwlo/x0j1jxreVUge
	D29IP3CehKILhPMAWtxsPXahwDBbpwfIGD6r+h47ZFwVIVG2aBSTLrTCx+tg/SUaJJo+
	ssuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:content-transfer-encoding
	:in-reply-to:references:subject:from:to:cc:message-id:user-agent
	:date;
	bh=4VPnLBfnP+yE8XWhPk6Z0NZmIvwwW0UIFWDe0blP3PA=;
	b=RA9lkIuxeSp7Qqk8VMKN6G+tvl/4L6QcHtPxi0xfBIBkAgAqusyrNrEhAo9V89Aj45
	EECnlQ9L553M8VSHsm9lXxUiynw62Xojnn/dqlDoj5icjN8vx3yikncc/mK3aDHEsqKp
	8Cgj8wXxhtMEjaUD2AzCo1JYlrSmR9RtLA1BD3p8bzBXoH/X5dS1gBZWvpNnEQRSgoE0
	75B2IiZAD12q9xRdhfTQT5vtxO2oY4HpyriebjyirQ7qkvr6g+Dg8zpdqpYnKgAjmp91
	GZpTGzevACbCsQpOMLZsCmbcdX/Y/CisYwL9T5oR4pC8OGsDxeTLiqe15SUEMpYdX809
	Rhig==
X-Gm-Message-State: APjAAAUEY3XDqaKAu3AE9tq8paojwqRUjTKil0dnoOTj/qzwQ0jGU57O
	DuJQ0mGe/3rNRnvdM0y2tcw=
X-Google-Smtp-Source: APXvYqwq06G0czPEPLmYLoGzD2jqc2jTMs8sD6Gj1glkXKfoUr2VN70FHXc0dZ5zI3VGNbqDHyFU3Q==
X-Received: by 2002:adf:e5c2:: with SMTP id a2mr1799223wrn.91.1562074291836;
	Tue, 02 Jul 2019 06:31:31 -0700 (PDT)
Received: from localhost ([151.237.18.226])
	by smtp.gmail.com with ESMTPSA id b8sm2412981wmh.46.2019.07.02.06.31.30
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 02 Jul 2019 06:31:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20190702095918.12852-1-ihor.matushchak@foobox.net>
References: <20190702095918.12852-1-ihor.matushchak@foobox.net>
Subject: Re: [PATCH] virtio-mmio: add error check for platform_get_irq
From: "Ivan T. Ivanov" <iivanov.xz@gmail.com>
To: Ihor Matushchak <ihor.matushchak@foobox.net>, mst@redhat.com
Message-ID: <156207429000.5051.5975712347598980745@silver>
User-Agent: alot/0.8.1
Date: Tue, 02 Jul 2019 16:31:30 +0300
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


Hi,

Quoting Ihor Matushchak (2019-07-02 12:59:18)
> in vm_find_vqs() irq has a wrong type
> so, in case of no IRQ resource defined,
> wrong parameter will be passed to request_irq()
> 
> Signed-off-by: Ihor Matushchak <ihor.matushchak@foobox.net>
> ---
>  drivers/virtio/virtio_mmio.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
> index f363fbeb5ab0..60dde8ed163b 100644
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
> +               dev_err(&vdev->dev, "no IRQ resource defined\n");
> +               return -ENODEV;

Don't overwrite error code value. Just return it as it is.

Regards,
Ivan

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
