Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6662D1FE1
	for <lists.virtualization@lfdr.de>; Tue,  8 Dec 2020 02:21:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9016B806F2;
	Tue,  8 Dec 2020 01:21:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FSc--qhumPD6; Tue,  8 Dec 2020 01:21:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 157CA87E5D;
	Tue,  8 Dec 2020 01:21:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9CB3C013B;
	Tue,  8 Dec 2020 01:21:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42359C013B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Dec 2020 01:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3C4A687D2B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Dec 2020 01:21:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ctk-2Qi7fY0T
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Dec 2020 01:21:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BF842806F2
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Dec 2020 01:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=vXfBmV1WtpQrMd4/iEKqvXO0wvtb19cUUXMuUNVtQi4=; b=Rjq77hcRxkpyBdxp7o+bgrP+kA
 qmjJgvrrF1pNpYJwCTCyhfePAXp/wWm0Pkcb/rp5IQ2dVh7XfivNR2zy/DJ0odUFEht4kfP0AqWk0
 6um4Vrip3g+f4C2/F4gCj7mBfTG9BsHVQDgylUSAmTu8/UTyCKMKyJHHXWU94nWCCtu14BOXe0hMt
 MNhseyweAsJyePULtVrFbONLqF2H96ys1T1axJl4x3EzSJADMtoNC2HMp8N5lCA2nywHr54Sh9tQR
 ZRUqRZelOOWhInu3zWEJOEqUr5XH4mbGiB7c8xP9ZonpIY7BlUhf+6Qar+jbLgWOS97ZXbI0lQ5O3
 efwRnr9g==;
Received: from [2601:1c0:6280:3f0::1494]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmRgd-0007VO-4E; Tue, 08 Dec 2020 01:21:03 +0000
Subject: Re: [PATCH v3] drivers: gpio: add virtio-gpio guest driver
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
References: <20201207204838.21406-1-info@metux.net>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3b550dcf-7e4d-39d2-bcaf-3f6cdb688da0@infradead.org>
Date: Mon, 7 Dec 2020 17:20:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207204838.21406-1-info@metux.net>
Content-Language: en-US
Cc: corbet@lwn.net, mst@redhat.com, linus.walleij@linaro.org,
 linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
 linux-riscv@lists.infradead.org
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

On 12/7/20 12:48 PM, Enrico Weigelt, metux IT consult wrote:
> Introducing new GPIO driver for virtual GPIO devices via virtio.
> 

Oops, I missed one thing:


> 
> diff --git a/Documentation/gpio/virtio-gpio.rst b/Documentation/gpio/virtio-gpio.rst
> new file mode 100644
> index 000000000000..e7bf01ec1ce7
> --- /dev/null
> +++ b/Documentation/gpio/virtio-gpio.rst
> @@ -0,0 +1,176 @@
> +"""""""""""""""""
> +Virtio-GPIO protocol specification
> +"""""""""""""""""


In Documentation/doc-guide/sphinx.rst, it says to please use the
following heading adornments....
and """""...""""" is not one of them.

Neither is "..........".

Also, only use an overline for the document title and not for
lower level headings.

Here are the expected heading adornments:

  1. ``=`` with overline for document title::

       ==============
       Document title
       ==============

  2. ``=`` for chapters::

       Chapters
       ========

  3. ``-`` for sections::

       Section
       -------

  4. ``~`` for subsections::

       Subsection
       ~~~~~~~~~~


> +...........
> +Specification for virtio-based virtiual GPIO devices
> +...........
> +
> ++------------
> ++Version_ 1.0
> ++------------
> +
> +===================
> +General
> +===================
> +
> +The virtio-gpio protocol provides access to general purpose IO devices
> +to virtual machine guests. These virtualized GPIOs could be either provided
> +by some simulator (eg. virtual HIL), routed to some external device or
> +routed to real GPIOs on the host (eg. virtualized embedded applications).
> +
> +Instead of simulating some existing real GPIO chip within an VMM, this
> +protocol provides an hardware independent interface between host and guest
> +that solely relies on an active virtio connection (no matter which transport
> +actually used), no other buses or additional platform driver logic required.
> +
> +===================
> +Protocol layout
> +===================
> +
> +----------------------
> +Configuration space
> +----------------------


thanks.
-- 
~Randy

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
