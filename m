Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD8D1AD18
	for <lists.virtualization@lfdr.de>; Sun, 12 May 2019 18:47:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0328FE20;
	Sun, 12 May 2019 16:47:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B6F4AAA5
	for <virtualization@lists.linux-foundation.org>;
	Sun, 12 May 2019 16:47:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 37766E6
	for <virtualization@lists.linux-foundation.org>;
	Sun, 12 May 2019 16:47:44 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id o7so12203637qtp.4
	for <virtualization@lists.linux-foundation.org>;
	Sun, 12 May 2019 09:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=7o3LEQCQPDtmFSsmSC3vipKIcty8VWe+hgkqS93xaSo=;
	b=P/XLRRUFKjzv6Fiky8bg2G3GixwSq5yV4pDmfZCl5mZ1lrPrsp6pJNJcH4xC4M7fcx
	OG6Wj3Ht5fbZqbABKc/Bzv+K6CnZq0ZRWauiTPhnFJX+wdCkCC2LF0vBNVZMGyR/WM6F
	fjhlEhNcUh+H68oBIY0ynOBAi8/+jKgz4We8xk26IqfG6ecTFrCKO+uXUj1VRKR7YIWn
	zEvmOQQMBQkX8PVbvwDmtK00e8vqTCsxQ5A0ZDD5tL1A3gF6AIyx9WjxNfzQNmxNFcLj
	PYLThAA5os1n1jw3k/nSPfXdH65Y/vmGTwvSCcgcdK+DxcdhFajdGHOr0mQ1eWLMuF1B
	KfDw==
X-Gm-Message-State: APjAAAVhZX4cDwCuVb45YvTt47c6Koy53UxXH+61rPrW7yQdUV8sEbLZ
	OO8vZwT1Vr5WBaPXZUOBsXZtRA==
X-Google-Smtp-Source: APXvYqyv5kOot3ZFPGxLHODMB/9bBhskS0nJjpF7PYJWBTsondGf/CRT2l9A/oiQkR/k1B/FZNlcsg==
X-Received: by 2002:aed:3aaa:: with SMTP id o39mr19851952qte.100.1557679663489;
	Sun, 12 May 2019 09:47:43 -0700 (PDT)
Received: from redhat.com (pool-173-76-105-71.bstnma.fios.verizon.net.
	[173.76.105.71])
	by smtp.gmail.com with ESMTPSA id e3sm6940655qkn.93.2019.05.12.09.47.41
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 12 May 2019 09:47:42 -0700 (PDT)
Date: Sun, 12 May 2019 12:47:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 01/10] virtio/s390: use vring_create_virtqueue
Message-ID: <20190512124730-mutt-send-email-mst@kernel.org>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-2-pasic@linux.ibm.com>
	<20190503111724.70c6ec37.cohuck@redhat.com>
	<20190503160421-mutt-send-email-mst@kernel.org>
	<20190504160340.29f17b98.pasic@linux.ibm.com>
	<20190505131523.159bec7c.cohuck@redhat.com>
	<ed6cbf63-f2ff-f259-ccb0-3b9ba60f2b35@de.ibm.com>
	<20190510160744.00285367.cohuck@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190510160744.00285367.cohuck@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
	Sebastian Ott <sebott@linux.ibm.com>,
	Christoph Hellwig <hch@infradead.org>, Farhan Ali <alifm@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Halil Pasic <pasic@linux.ibm.com>,
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

On Fri, May 10, 2019 at 04:07:44PM +0200, Cornelia Huck wrote:
> On Tue, 7 May 2019 15:58:12 +0200
> Christian Borntraeger <borntraeger@de.ibm.com> wrote:
> 
> > On 05.05.19 13:15, Cornelia Huck wrote:
> > > On Sat, 4 May 2019 16:03:40 +0200
> > > Halil Pasic <pasic@linux.ibm.com> wrote:
> > >   
> > >> On Fri, 3 May 2019 16:04:48 -0400
> > >> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > >>  
> > >>> On Fri, May 03, 2019 at 11:17:24AM +0200, Cornelia Huck wrote:    
> > >>>> On Fri, 26 Apr 2019 20:32:36 +0200
> > >>>> Halil Pasic <pasic@linux.ibm.com> wrote:
> > >>>>     
> > >>>>> The commit 2a2d1382fe9d ("virtio: Add improved queue allocation API")
> > >>>>> establishes a new way of allocating virtqueues (as a part of the effort
> > >>>>> that taught DMA to virtio rings).
> > >>>>>
> > >>>>> In the future we will want virtio-ccw to use the DMA API as well.
> > >>>>>
> > >>>>> Let us switch from the legacy method of allocating virtqueues to
> > >>>>> vring_create_virtqueue() as the first step into that direction.
> > >>>>>
> > >>>>> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > >>>>> ---
> > >>>>>  drivers/s390/virtio/virtio_ccw.c | 30 +++++++++++-------------------
> > >>>>>  1 file changed, 11 insertions(+), 19 deletions(-)    
> > >>>>
> > >>>> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> > >>>>
> > >>>> I'd vote for merging this patch right away for 5.2.    
> > >>>
> > >>> So which tree is this going through? mine?
> > >>>     
> > >>
> > >> Christian, what do you think? If the whole series is supposed to go in
> > >> in one go (which I hope it is), via Martin's tree could be the simplest
> > >> route IMHO.  
> > > 
> > > 
> > > The first three patches are virtio(-ccw) only and the those are the ones
> > > that I think are ready to go.
> > > 
> > > I'm not feeling comfortable going forward with the remainder as it
> > > stands now; waiting for some other folks to give feedback. (They are
> > > touching/interacting with code parts I'm not so familiar with, and lack
> > > of documentation, while not the developers' fault, does not make it
> > > easier.)
> > > 
> > > Michael, would you like to pick up 1-3 for your tree directly? That
> > > looks like the easiest way.  
> > 
> > Agreed. Michael please pick 1-3.
> > We will continue to review 4- first and then see which tree is best.
> 
> Michael, please let me know if you'll pick directly or whether I should
> post a series.
> 
> [Given that the patches are from one virtio-ccw maintainer and reviewed
> by the other, picking directly would eliminate an unnecessary
> indirection :)]

picked them
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
