Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C9BABAAD
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 16:19:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 06AC52394;
	Fri,  6 Sep 2019 14:18:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 430B42357
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 14:18:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id F1E88756
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 14:18:56 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
	[209.85.160.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7B6D781F22
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 14:18:56 +0000 (UTC)
Received: by mail-qt1-f197.google.com with SMTP id f19so6473686qtq.1
	for <virtualization@lists.linux-foundation.org>;
	Fri, 06 Sep 2019 07:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=741o/xQPcgkh8sbSjiFyBn3gsnAEkmJOCIfqfDhtUBo=;
	b=fkYmBOHAR4mzUSq6eNI9V/nHwX9um6RV/aykrYRSWYcKRopOgbwreY8kYgNliOPVI8
	b12ez0nCln5UgiT8YYvJOBgiy0OtoUIX/sDUe0JtSVy4OE887JDKpeMqVijNmL5NpP2V
	pmJa6MH7Kw18bbyacamgimUc5uAjtJbkRjoUFx7FNN404R7R/vbBWbDGkIzq8rChnae8
	36fJAb6XfYbmkS2MD+r5L/UImW4hCB+zBn56B65bOqamCqx2i+wVAEB5r34hH6/sZhCS
	bkyqsEsz3x/ezDCQ8TznSxRH5KFjyA29ldwLwKF4wHgcUBsDJcvUChAfSQqixXpeWL+V
	WD7Q==
X-Gm-Message-State: APjAAAWpZGkwfPqHxRF6CNgpaK15YqFKkBKC1lfo+4Zco9yywpF5LxEk
	9duZp11rnzkrGZB9e7yVaQ8lSz0thTfIKKaxeS6Wk90la3YveAIOy1AtELUTa1jAdhKcZoncvNh
	3MMZEGxIXX6IHLJF6NVIhuRuNIS58PzjAl+qgOhQsoA==
X-Received: by 2002:ac8:3195:: with SMTP id h21mr9753400qte.350.1567779535854; 
	Fri, 06 Sep 2019 07:18:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxGLpg1Ryu90HpqFQxE1o/aqz1GtskO77HSqagnTOVU8en/4xP+XAgktTlx6GUHLSwh5hScgw==
X-Received: by 2002:ac8:3195:: with SMTP id h21mr9753390qte.350.1567779535712; 
	Fri, 06 Sep 2019 07:18:55 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
	by smtp.gmail.com with ESMTPSA id
	g12sm2422156qkm.25.2019.09.06.07.18.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 07:18:54 -0700 (PDT)
Date: Fri, 6 Sep 2019 10:18:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 08/18] virtiofs: Drain all pending requests during
	->remove time
Message-ID: <20190906101819-mutt-send-email-mst@kernel.org>
References: <20190905194859.16219-1-vgoyal@redhat.com>
	<20190905194859.16219-9-vgoyal@redhat.com>
	<20190906105210.GP5900@stefanha-x1.localdomain>
	<20190906141705.GF22083@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906141705.GF22083@redhat.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: miklos@szeredi.hu, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, virtio-fs@redhat.com,
	Stefan Hajnoczi <stefanha@redhat.com>,
	linux-fsdevel@vger.kernel.org, dgilbert@redhat.com
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

On Fri, Sep 06, 2019 at 10:17:05AM -0400, Vivek Goyal wrote:
> On Fri, Sep 06, 2019 at 11:52:10AM +0100, Stefan Hajnoczi wrote:
> > On Thu, Sep 05, 2019 at 03:48:49PM -0400, Vivek Goyal wrote:
> > > +static void virtio_fs_drain_queue(struct virtio_fs_vq *fsvq)
> > > +{
> > > +	WARN_ON(fsvq->in_flight < 0);
> > > +
> > > +	/* Wait for in flight requests to finish.*/
> > > +	while (1) {
> > > +		spin_lock(&fsvq->lock);
> > > +		if (!fsvq->in_flight) {
> > > +			spin_unlock(&fsvq->lock);
> > > +			break;
> > > +		}
> > > +		spin_unlock(&fsvq->lock);
> > > +		usleep_range(1000, 2000);
> > > +	}
> > 
> > I think all contexts that call this allow sleeping so we could avoid
> > usleep here.
> 
> usleep_range() is supposed to be used from non-atomic context.
> 
> https://github.com/torvalds/linux/blob/master/Documentation/timers/timers-howto.rst
> 
> What construct you are thinking of?
> 
> Vivek

completion + signal on vq callback?

-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
