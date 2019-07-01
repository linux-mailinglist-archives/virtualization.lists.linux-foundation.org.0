Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6E61B690
	for <lists.virtualization@lfdr.de>; Mon, 13 May 2019 14:59:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 080DCDAF;
	Mon, 13 May 2019 12:59:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 00223DAF
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 12:59:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DE92D27B
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 12:59:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3BFF030054AB;
	Mon, 13 May 2019 12:59:10 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 58F191001E98;
	Mon, 13 May 2019 12:59:05 +0000 (UTC)
Date: Mon, 13 May 2019 14:59:03 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 07/10] s390/airq: use DMA memory for adapter interrupts
Message-ID: <20190513145903.47446b4d.cohuck@redhat.com>
In-Reply-To: <20190426183245.37939-8-pasic@linux.ibm.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-8-pasic@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Mon, 13 May 2019 12:59:10 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
	Sebastian Ott <sebott@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Farhan Ali <alifm@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Viktor Mihajlovski <mihajlov@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>
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

On Fri, 26 Apr 2019 20:32:42 +0200
Halil Pasic <pasic@linux.ibm.com> wrote:

> Protected virtualization guests have to use shared pages for airq
> notifier bit vectors, because hypervisor needs to write these bits.
> 
> Let us make sure we allocate DMA memory for the notifier bit vectors.

[Looking at this first, before I can think about your update in patch
5.]

> 
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> ---
>  arch/s390/include/asm/airq.h |  2 ++
>  drivers/s390/cio/airq.c      | 18 ++++++++++++++----
>  2 files changed, 16 insertions(+), 4 deletions(-)

(...)

> diff --git a/drivers/s390/cio/airq.c b/drivers/s390/cio/airq.c
> index a45011e4529e..7a5c0a08ee09 100644
> --- a/drivers/s390/cio/airq.c
> +++ b/drivers/s390/cio/airq.c
> @@ -19,6 +19,7 @@
>  
>  #include <asm/airq.h>
>  #include <asm/isc.h>
> +#include <asm/cio.h>
>  
>  #include "cio.h"
>  #include "cio_debug.h"
> @@ -113,6 +114,11 @@ void __init init_airq_interrupts(void)
>  	setup_irq(THIN_INTERRUPT, &airq_interrupt);
>  }
>  
> +static inline unsigned long iv_size(unsigned long bits)
> +{
> +	return BITS_TO_LONGS(bits) * sizeof(unsigned long);
> +}
> +
>  /**
>   * airq_iv_create - create an interrupt vector
>   * @bits: number of bits in the interrupt vector
> @@ -123,14 +129,15 @@ void __init init_airq_interrupts(void)
>  struct airq_iv *airq_iv_create(unsigned long bits, unsigned long flags)
>  {
>  	struct airq_iv *iv;
> -	unsigned long size;
> +	unsigned long size = 0;

Why do you need to init this to 0?

>  
>  	iv = kzalloc(sizeof(*iv), GFP_KERNEL);
>  	if (!iv)
>  		goto out;
>  	iv->bits = bits;
> -	size = BITS_TO_LONGS(bits) * sizeof(unsigned long);
> -	iv->vector = kzalloc(size, GFP_KERNEL);
> +	size = iv_size(bits);
> +	iv->vector = dma_alloc_coherent(cio_get_dma_css_dev(), size,
> +						 &iv->vector_dma, GFP_KERNEL);

Indent is a bit off.

But more importantly, I'm also a bit vary about ap and pci. IIRC, css
support is mandatory, so that should not be a problem; and unless I
remember incorrectly, ap only uses summary indicators. How does this
interact with pci devices? I suppose any of their dma properties do not
come into play with the interrupt code here? (Just want to be sure.)

>  	if (!iv->vector)
>  		goto out_free;
>  	if (flags & AIRQ_IV_ALLOC) {
> @@ -165,7 +172,8 @@ struct airq_iv *airq_iv_create(unsigned long bits, unsigned long flags)
>  	kfree(iv->ptr);
>  	kfree(iv->bitlock);
>  	kfree(iv->avail);
> -	kfree(iv->vector);
> +	dma_free_coherent(cio_get_dma_css_dev(), size, iv->vector,
> +			  iv->vector_dma);
>  	kfree(iv);
>  out:
>  	return NULL;
> @@ -182,6 +190,8 @@ void airq_iv_release(struct airq_iv *iv)
>  	kfree(iv->ptr);
>  	kfree(iv->bitlock);
>  	kfree(iv->vector);
> +	dma_free_coherent(cio_get_dma_css_dev(), iv_size(iv->bits),
> +			  iv->vector, iv->vector_dma);
>  	kfree(iv->avail);
>  	kfree(iv);
>  }

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
