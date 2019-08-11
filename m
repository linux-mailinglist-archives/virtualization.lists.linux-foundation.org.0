Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B2E890B4
	for <lists.virtualization@lfdr.de>; Sun, 11 Aug 2019 10:43:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D2AA4AF7;
	Sun, 11 Aug 2019 08:42:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 69458ACC
	for <virtualization@lists.linux-foundation.org>;
	Sun, 11 Aug 2019 08:42:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4283E6E0
	for <virtualization@lists.linux-foundation.org>;
	Sun, 11 Aug 2019 08:42:47 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id q4so2858973qtp.1
	for <virtualization@lists.linux-foundation.org>;
	Sun, 11 Aug 2019 01:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=OwTyRG3c0uWeDZrJY6ZpPNgUs/dENdNyzYLQJF235ng=;
	b=bU7tU2lNHQf8rDdhmoOHm5DvJsk/CAnf6oQC/YhhrUmN/nNuKCidsPlM1msjo6mtQO
	IfZXhUBKzRvkJqZ9qH8nxwTbmX4G5Sj5AyI40T9qE/0acxNU9pP/O9Wh3zqLVgOE8ii1
	yb/lEeS5/eVMgXtJ/lo6RKtU63lVy5SCEsDBKEoMaODEpflq3WVI04IqN9rprtsQp8xg
	k7/FkjCmwFDX6hObEM/rKZJJ61f/zoG83VAU7PUta33IgA1J2hC4AoCu/aUvw3EhI7NU
	LfZT95sidx2Y7qsL9bF7iv1jplssWdc41LS2IJHWRxwZVqIK2zavLJrXGNE9DKqytr0c
	yX3g==
X-Gm-Message-State: APjAAAUYTZzheoMxmw04gtnF4ocs9+zWIaBwCdz9opKaC06jb5FLVogT
	PpCGKXXEf7BSymWFbbesVh3Zxg==
X-Google-Smtp-Source: APXvYqzuHJ2U68lDoEL7EBgwf3NbWFXfC318bVrfWPFs3lvkcljrjOCTNgmV+LGovkQ0nKOOObqhmg==
X-Received: by 2002:a0c:ae6d:: with SMTP id z42mr25654119qvc.8.1565512966475; 
	Sun, 11 Aug 2019 01:42:46 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	m5sm42472030qkb.117.2019.08.11.01.42.41
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 11 Aug 2019 01:42:45 -0700 (PDT)
Date: Sun, 11 Aug 2019 04:42:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC PATCH] virtio_ring: Use DMA API if guest memory is encrypted
Message-ID: <20190811041636-mutt-send-email-mst@kernel.org>
References: <87zhrj8kcp.fsf@morokweng.localdomain>
	<20190810143038-mutt-send-email-mst@kernel.org>
	<20190810220702.GA5964@ram.ibm.com> <20190811055607.GA12488@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190811055607.GA12488@lst.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Alexey Kardashevskiy <aik@linux.ibm.com>,
	Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Paul Mackerras <paulus@ozlabs.org>, iommu@lists.linux-foundation.org,
	linuxppc-devel@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
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
> And once again this is entirely going in the wrong direction.  The only
> way using the DMA API is going to work at all is if the device is ready
> for it.

So the point made is that if DMA addresses are also physical addresses
(not necessarily the same physical addresses that driver supplied), then
DMA API actually works even though device itself uses CPU page tables.


To put it in other terms: it would be possible to make all or part of
memory unenecrypted and then have virtio access all of it.  SEV guests
at the moment make a decision to instead use a bounce buffer, forcing an
extra copy but gaining security.

-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
