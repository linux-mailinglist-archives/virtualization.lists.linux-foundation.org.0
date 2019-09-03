Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDECA6AE1
	for <lists.virtualization@lfdr.de>; Tue,  3 Sep 2019 16:12:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 68C25CCE;
	Tue,  3 Sep 2019 14:12:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 23390907
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 14:12:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D2EA5756
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 14:12:22 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
	[209.85.160.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5D3C788307
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 14:12:22 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id i19so19010351qtq.17
	for <virtualization@lists.linux-foundation.org>;
	Tue, 03 Sep 2019 07:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=B2BfNzrm+hR7i1mNls3IhAz7GlKTxZk9pYPgMdNVli0=;
	b=UhN7cX8GDi+VMI/GMJUHxvU9W5KYm9D+3LabQkkGtcipUddPLDjVi5PiPxZ4nHqRuf
	/oPE+ZJ1S6FFza6FhTjV4Wx3hDlO7M9GyTHnVRw21bXJMmpvn6btjvslih0Jji5ZfFiQ
	W6tztXCzIQrQ//VzsRMa0+c3doAWQ9JfI7jH4Pqb8jN7GSgfSpeb9vNJ5Qk+UB5qbgYI
	U3sx/oW49DFINPuoh3eykmVOAPVmggPZo9WMEt6cdHSJnpPuZj/siixwCIJ9lN3Kdy+E
	0wliu8AkOk+iSsF9D9t6IMjmqlqJnaI0USl5Mz6P7dhPofexOXTpx7rEUh2zTgastvm6
	9e+w==
X-Gm-Message-State: APjAAAVfsc9LhvkH+fWc0Q6brKJ+pyxpb57S9K7JmU4pdAaO/XnkGBU3
	Ufd2fI2bm//uWbYW+c6xeqCKQeYkwMgKJOs02K6aYPKIwr0BRTfzaIIxttvPEKdQTWwwogl8Lre
	+mBxq5M+p/Ljrt1R3FjDSWWoXSVMC6W93dUQeEAHSyw==
X-Received: by 2002:ac8:19c7:: with SMTP id s7mr23669447qtk.392.1567519941737; 
	Tue, 03 Sep 2019 07:12:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwZD7QC/GbljRGHZ9kQkhQ8TANJQbERaI507U8NcnTvw54YKl5HRSRH5iHvxe2JtdirsGcbnA==
X-Received: by 2002:ac8:19c7:: with SMTP id s7mr23669437qtk.392.1567519941605; 
	Tue, 03 Sep 2019 07:12:21 -0700 (PDT)
Received: from redhat.com (bzq-79-180-62-110.red.bezeqint.net. [79.180.62.110])
	by smtp.gmail.com with ESMTPSA id
	b123sm8764984qkf.85.2019.09.03.07.12.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 07:12:20 -0700 (PDT)
Date: Tue, 3 Sep 2019 10:12:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v3 00/13] virtio-fs: shared file system for virtual
	machines
Message-ID: <20190903101001-mutt-send-email-mst@kernel.org>
References: <20190821173742.24574-1-vgoyal@redhat.com>
	<CAJfpegvPTxkaNhXWhiQSprSJqyW1cLXeZEz6x_f0PxCd-yzHQg@mail.gmail.com>
	<20190903041507-mutt-send-email-mst@kernel.org>
	<20190903140752.GA10983@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903140752.GA10983@redhat.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, virtio-fs@redhat.com,
	Stefan Hajnoczi <stefanha@redhat.com>, linux-fsdevel@vger.kernel.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
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

On Tue, Sep 03, 2019 at 10:07:52AM -0400, Vivek Goyal wrote:
> On Tue, Sep 03, 2019 at 04:31:38AM -0400, Michael S. Tsirkin wrote:
> 
> [..]
> > +	/* TODO lock */
> > give me pause.
> > 
> > Cleanup generally seems broken to me - what pauses the FS
> 
> I am looking into device removal aspect of it now. Thinking of adding
> a reference count to virtiofs device and possibly also a bit flag to
> indicate if device is still alive. That way, we should be able to cleanup
> device more gracefully.

Generally, the way to cleanup things is to first disconnect device from
linux so linux won't send new requests, wait for old ones to finish.




> > 
> > What about the rest of TODOs in that file?
> 
> I will also take a closer look at TODOs now. Better device cleanup path
> might get rid of some of them. Some of them might not be valid anymore.
> 
> > 
> > use of usleep is hacky - can't we do better e.g. with a
> > completion?
> 
> Agreed.
> 
> Thanks
> Vivek
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
