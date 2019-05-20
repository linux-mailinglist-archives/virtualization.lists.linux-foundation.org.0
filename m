Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8FB236D5
	for <lists.virtualization@lfdr.de>; Mon, 20 May 2019 15:17:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DB353D73;
	Mon, 20 May 2019 13:17:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4E095D39
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 13:17:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DA8FCA3
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 13:17:02 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id a64so8756483qkg.5
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 06:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=bZcyqtPfiR8OnSe7X+YvU6P3WmrTts8Lp+0qyg4aj2M=;
	b=IafgzrR3lK9Qk+QQlY4eRf7TWo7M//xczfE7S+BOCm+a2vLFAEVA480yEAhspsPmiL
	DW9QFHSWr2Csp9LXNay8qGyh6foOqqtjV8t8BO+C3jcxk2ZRCXuYZFb2PsJ823S4dTLv
	kqpq+58KSgARKctvCE5ER01AgnZ0SnXLbGqGtjF07zHNQr55/0QeILN8EMOLcPQhcoBo
	Ux0KIfEsJngVJesCc4noevpYe2H+3ijDXmQyybBhmLTpZFfzvXBAwq5D/zY+MebYCqJO
	WruPJwxJSH/vYx+7CM6BBz2cMIvVvR+kjwXrzQjMgIdBsR0ajhIdkaxqcEAcKSgkAO9k
	svtA==
X-Gm-Message-State: APjAAAWXz1pIdiZFLetaeJ/oAJz2QQ1JqCd84IUdK8bkF6ZXTA/OVQM4
	PFQpomVvgEDu2zwLixpFyKa8Dw==
X-Google-Smtp-Source: APXvYqw0FqLkxwDq3if4j/PtdUGJI5ox1BH3UIwaju3gNcXX5ayK/jpLunGqH+2wq+Rcle7lAXdfbA==
X-Received: by 2002:a37:4c02:: with SMTP id z2mr46791719qka.1.1558358222050;
	Mon, 20 May 2019 06:17:02 -0700 (PDT)
Received: from redhat.com (pool-173-76-105-71.bstnma.fios.verizon.net.
	[173.76.105.71]) by smtp.gmail.com with ESMTPSA id
	d16sm11577917qtd.73.2019.05.20.06.16.59
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 20 May 2019 06:17:00 -0700 (PDT)
Date: Mon, 20 May 2019 09:16:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [RFC PATCH] virtio_ring: Use DMA API if guest memory is encrypted
Message-ID: <20190520090939-mutt-send-email-mst@kernel.org>
References: <87zhrj8kcp.fsf@morokweng.localdomain>
	<87womn8inf.fsf@morokweng.localdomain>
	<20190129134750-mutt-send-email-mst@kernel.org>
	<877eefxvyb.fsf@morokweng.localdomain>
	<20190204144048-mutt-send-email-mst@kernel.org>
	<87ef71seve.fsf@morokweng.localdomain>
	<20190320171027-mutt-send-email-mst@kernel.org>
	<87tvfvbwpb.fsf@morokweng.localdomain>
	<20190323165456-mutt-send-email-mst@kernel.org>
	<87a7go71hz.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a7go71hz.fsf@morokweng.localdomain>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Mike Anderson <andmike@linux.ibm.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Alexey Kardashevskiy <aik@linux.ibm.com>,
	Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Paul Mackerras <paulus@ozlabs.org>,
	iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
	Christoph Hellwig <hch@lst.de>, David Gibson <david@gibson.dropbear.id.au>
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

On Wed, Apr 17, 2019 at 06:42:00PM -0300, Thiago Jung Bauermann wrote:
> I rephrased it in terms of address translation. What do you think of
> this version? The flag name is slightly different too:
> 
> 
> VIRTIO_F_ACCESS_PLATFORM_NO_TRANSLATION This feature has the same
>     meaning as VIRTIO_F_ACCESS_PLATFORM both when set and when not set,
>     with the exception that address translation is guaranteed to be
>     unnecessary when accessing memory addresses supplied to the device
>     by the driver. Which is to say, the device will always use physical
>     addresses matching addresses used by the driver (typically meaning
>     physical addresses used by the CPU) and not translated further. This
>     flag should be set by the guest if offered, but to allow for
>     backward-compatibility device implementations allow for it to be
>     left unset by the guest. It is an error to set both this flag and
>     VIRTIO_F_ACCESS_PLATFORM.


OK so VIRTIO_F_ACCESS_PLATFORM is designed to allow unpriveledged
drivers. This is why devices fail when it's not negotiated.

This confuses me.
If driver is unpriveledged then what happens with this flag?
It can supply any address it wants. Will that corrupt kernel
memory?

-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
