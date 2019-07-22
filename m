Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 809BF6FBF5
	for <lists.virtualization@lfdr.de>; Mon, 22 Jul 2019 11:14:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4C939C7C;
	Mon, 22 Jul 2019 09:14:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BEBEA949
	for <virtualization@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 09:14:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 37C29F8
	for <virtualization@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 09:14:39 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id x15so34361880wmj.3
	for <virtualization@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 02:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=buyBwragh/MiAtoP/qWU/+3wC1FPeSO8mS8xKGZe0WM=;
	b=SSsoudKsP1DHoMnLqhpC+WCusjG8hX6NOzwlFngWOZBwI1kvljXAHNKlJMQKYCGbtm
	trmxR/B4xNd63kcyZWebXJmGZkiHp9e5yRIgjnJ7502pbi16LQ1ubEa1xuqtZTBsDjMX
	WAFGOJan3Ndd0bO/l12cuxApARcgHIGnxANYV3loD4oRU3zVKV2CP5EPBZ2vOY++IEoM
	D8m+9k0LhxPmGT1uaKP3wHmalpkYRLNDZJCrcLreqAn0bd7t+3vC0fGMiNbEkL3Tzv+I
	RzMGwTQAiVyqNw+LBbhktKD+QJp/PItOxoL0m97KocH1WDjuHhoA6ZWIeJbvHtkOMPAj
	8xPw==
X-Gm-Message-State: APjAAAUoiYLtMcYeSMvNymAxu+kjaP+iiXk/+nsnasrB8ypopHKk0Dbf
	rMegJDV9fOhfXtDfc1atkRdBRw==
X-Google-Smtp-Source: APXvYqxfShD/ei8RpJHH52M/aLQwRYii5G8tfg7PqTI4yQdrNr4boM5EbfQYG922Ax7/DzQZYsBz9A==
X-Received: by 2002:a1c:5f87:: with SMTP id
	t129mr66150883wmb.150.1563786877819; 
	Mon, 22 Jul 2019 02:14:37 -0700 (PDT)
Received: from steredhat (host122-201-dynamic.13-79-r.retail.telecomitalia.it.
	[79.13.201.122]) by smtp.gmail.com with ESMTPSA id
	18sm35831732wmg.43.2019.07.22.02.14.36
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 22 Jul 2019 02:14:37 -0700 (PDT)
Date: Mon, 22 Jul 2019 11:14:34 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4 0/5] vsock/virtio: optimizations to increase the
	throughput
Message-ID: <20190722091434.tzf7lxw3tvrs5w5v@steredhat>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190722090835.GF24934@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722090835.GF24934@stefanha-x1.localdomain>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	"David S. Miller" <davem@davemloft.net>
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

On Mon, Jul 22, 2019 at 10:08:35AM +0100, Stefan Hajnoczi wrote:
> On Wed, Jul 17, 2019 at 01:30:25PM +0200, Stefano Garzarella wrote:
> > This series tries to increase the throughput of virtio-vsock with slight
> > changes.
> > While I was testing the v2 of this series I discovered an huge use of memory,
> > so I added patch 1 to mitigate this issue. I put it in this series in order
> > to better track the performance trends.
> > 
> > v4:
> > - rebased all patches on current master (conflicts is Patch 4)
> > - Patch 1: added Stefan's R-b
> > - Patch 3: removed lock when buf_alloc is written [David];
> >            moved this patch after "vsock/virtio: reduce credit update messages"
> >            to make it clearer
> > - Patch 4: vhost_exceeds_weight() is recently introduced, so I've solved some
> >            conflicts
> 
> Stefano: Do you want to continue experimenting before we merge this
> patch series?  The code looks functionally correct and the performance
> increases, so I'm happy for it to be merged.

I think we can merge this series.

I'll continue to do other experiments (e.g. removing TX workers, allocating
pages, etc.) but I think these changes are prerequisites for the other patches,
so we can merge them.

Thank you very much for the reviews!
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
