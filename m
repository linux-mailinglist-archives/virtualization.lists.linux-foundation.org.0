Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B81F890C6
	for <lists.virtualization@lfdr.de>; Sun, 11 Aug 2019 10:55:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B0BA3AF0;
	Sun, 11 Aug 2019 08:55:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 53988ACD
	for <virtualization@lists.linux-foundation.org>;
	Sun, 11 Aug 2019 08:55:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E76886E0
	for <virtualization@lists.linux-foundation.org>;
	Sun, 11 Aug 2019 08:55:34 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id x4so2002899qts.5
	for <virtualization@lists.linux-foundation.org>;
	Sun, 11 Aug 2019 01:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=6/2qVAPvLy768Na8XqJHyfaQBOmu1VTQjHr1b0tqDos=;
	b=Q6vCLM9exW3LL06OpoH+x4e3eUW0dT2x9WtYSREnE/UcrYl3iCEUzePzgbTdaEJXCq
	6tzkMEL63c1bVOAaVS93b8RHskRJNRDcuwFnjlME4UApluAkPTxJYtYE5HzB6mIK3xOG
	D1aHiLfSyzcVjoDcOW8TF1zbuwlPBEIxMdkWXGDM1UgAgQm3r/Zu/EDBu/T5HnQCMXYU
	f1KEoSStG/Wom6baP8fNmQ6F81x2lqAaQJcgTrqL5UoL8+R6huR+j3oib5JENCCm01QB
	8uZ/Jw0XxGoVxQfydggaRiJ4bTm4Y8QA0hPOl8rQRhteFpgmnyPFwIjn6BI+wwklDWCA
	r/NA==
X-Gm-Message-State: APjAAAXLngOJF6c9txxTYMNhiyHLXHfv2mz0Abv16+FNIbl9dFncyRQu
	9jQXsDXze9Yjxqkbmsx0KgAsKQ==
X-Google-Smtp-Source: APXvYqwQSHWl5DZCKxcv6b09e+m/U60yeBUP2tSK+Zxbso+cleqVM/RZ1b43sqdRDBiAuYOyKuC1mA==
X-Received: by 2002:a0c:d91b:: with SMTP id p27mr25451190qvj.236.1565513734175;
	Sun, 11 Aug 2019 01:55:34 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	x26sm3314318qkn.116.2019.08.11.01.55.29
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 11 Aug 2019 01:55:33 -0700 (PDT)
Date: Sun, 11 Aug 2019 04:55:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC PATCH] virtio_ring: Use DMA API if guest memory is encrypted
Message-ID: <20190811044431-mutt-send-email-mst@kernel.org>
References: <87zhrj8kcp.fsf@morokweng.localdomain>
	<20190810143038-mutt-send-email-mst@kernel.org>
	<20190810220702.GA5964@ram.ibm.com> <20190811055607.GA12488@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190811055607.GA12488@lst.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Alexey Kardashevskiy <aik@linux.ibm.com>,
	Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Paul Mackerras <paulus@ozlabs.org>, iommu@lists.linux-foundation.org,
	David Gibson <david@gibson.dropbear.id.au>
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

On Sun, Aug 11, 2019 at 07:56:07AM +0200, Christoph Hellwig wrote:
> So we need a flag on the virtio device, exposed by the
> hypervisor (or hardware for hw virtio devices) that says:  hey, I'm real,
> don't take a shortcut.

The point here is that it's actually still not real. So we would still
use a physical address. However Linux decides that it wants extra
security by moving all data through the bounce buffer.  The distinction
made is that one can actually give device a physical address of the
bounce buffer.

-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
