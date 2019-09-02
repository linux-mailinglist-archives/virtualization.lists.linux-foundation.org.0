Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D7926A523B
	for <lists.virtualization@lfdr.de>; Mon,  2 Sep 2019 10:55:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 190DBCDE;
	Mon,  2 Sep 2019 08:55:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 222D0CD2
	for <virtualization@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 08:55:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BAE3A709
	for <virtualization@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 08:55:07 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F135B882EF
	for <virtualization@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 08:55:06 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id v16so1494203wrt.17
	for <virtualization@lists.linux-foundation.org>;
	Mon, 02 Sep 2019 01:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Zn38zF8kCwg/Vx1WwgH4NCJKhUG8AC5IPLG4wa1Ab7U=;
	b=fwPgL7iD4fMNAfY7+Ga4EtOYgKxJCaer04pOrfzHtE3nFl2J+McsdHchL1WyePvsvZ
	O4Pvs14O+WTfXa4/D4PVhq3Q1ytdTSvJP6jsY1jmlNJ1eexdP4O8D7A+T988Cck/nH1O
	gySdiXtLvujMq+msK33sUF0JdeUUalGs6tu+yPsnOGOKhqCHE1RLUhgOSUTQZh/ZssGA
	bnKaCogHaJMTyuxngw9C8+S84/sOvfCUV5lvv9pPKnOQ5rZf6umHW//IVHK7AZgMRJ/u
	oHqAhgZQzRVydzaFsWoW6aB25TATzubk3o6qP8PcPclVt5ItiLCH1nzKCK0maOcv9O3v
	gBfg==
X-Gm-Message-State: APjAAAWfh4prVBnd+BJXGyanunZ8naJkQWlNpJ9Cbm9iBHDKIAcBNjyU
	yc6weOHLxcPTC3b6ASgmYIpdW+8Xn7WtCR5+uV/Nq5voTVgg7h4wJp1ma9m7KiFbbvmXFvMTeP0
	dux4zADmOtDcAIH7pG9zRNwfcleeFCfFCdYVlp/1XbQ==
X-Received: by 2002:adf:e710:: with SMTP id c16mr35878951wrm.292.1567414505725;
	Mon, 02 Sep 2019 01:55:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxRv2dxDp5HY9Bd5yGXlGV+SOSiRsI1AgF+9hTAgXTKirFFUPOo1BMgb+sEqhfw0/g7IncCmA==
X-Received: by 2002:adf:e710:: with SMTP id c16mr35878922wrm.292.1567414505448;
	Mon, 02 Sep 2019 01:55:05 -0700 (PDT)
Received: from steredhat (host170-61-dynamic.36-79-r.retail.telecomitalia.it.
	[79.36.61.170]) by smtp.gmail.com with ESMTPSA id
	r5sm12305474wmh.35.2019.09.02.01.55.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Sep 2019 01:55:04 -0700 (PDT)
Date: Mon, 2 Sep 2019 10:55:02 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [PATCH v4 1/5] vsock/virtio: limit the memory used per-socket
Message-ID: <20190902085502.jlfo36aoka7lwi2u@steredhat>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190717113030.163499-2-sgarzare@redhat.com>
	<20190729095956-mutt-send-email-mst@kernel.org>
	<20190830094059.c7qo5cxrp2nkrncd@steredhat>
	<20190901024525-mutt-send-email-mst@kernel.org>
	<20190902083912.GA9069@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190902083912.GA9069@stefanha-x1.localdomain>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
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

On Mon, Sep 02, 2019 at 09:39:12AM +0100, Stefan Hajnoczi wrote:
> On Sun, Sep 01, 2019 at 02:56:44AM -0400, Michael S. Tsirkin wrote:
> > 
> > OK let me try to clarify.  The idea is this:
> > 
> > Let's say we queue a buffer of 4K, and we copy if len < 128 bytes.  This
> > means that in the worst case (128 byte packets), each byte of credit in
> > the socket uses up 4K/128 = 16 bytes of kernel memory. In fact we need
> > to also account for the virtio_vsock_pkt since I think it's kept around
> > until userspace consumes it.
> > 
> > Thus given X buf alloc allowed in the socket, we should publish X/16
> > credits to the other side. This will ensure the other side does not send
> > more than X/16 bytes for a given socket and thus we won't need to
> > allocate more than X bytes to hold the data.
> > 
> > We can play with the copy break value to tweak this.

Thanks Michael, now it is perfectly clear. It seems an excellent solution and
easy to implement. I'll work on that.

> 
> This seems like a reasonable solution.  Hopefully the benchmark results
> will come out okay too.

Yes, as Michael suggested I'll play with the copy break value to see as
benchmark has affected.

Thank you very much,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
