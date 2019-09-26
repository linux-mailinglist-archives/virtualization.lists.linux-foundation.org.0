Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E58BBF406
	for <lists.virtualization@lfdr.de>; Thu, 26 Sep 2019 15:26:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 825A311C8;
	Thu, 26 Sep 2019 13:26:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 037C41198
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 13:26:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B4E21B0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 13:26:31 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
	[209.85.222.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DF3992BFDC
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 13:26:30 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id s14so2337482qkg.12
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 06:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=W3FZ5vxqz4dbTcE/RzDr2BQP/Lbs5fzn9d+anVsPrI4=;
	b=NvEXE92Xk00U/6XizmpQZJUe3zgxqDRhxilizw7Qy8CmBa6gvDg1BaT5EOh1Zv6aTe
	OrkfIP0H2MKfJoUMN9ewQ/3L86Jui7hXCrFhBps3IEXswiXl1EswRrfpeNILDZ8KaDyk
	I/J7krhztZKdOXcOhxQyeIDjCSDM4dqXKAEBMknsi7Bzns8y1b+2gIktwyOgRr8bcpkU
	x8zpTOcHW3Ihxa4PO59m4ZKD4rqnM0SGGnXIhCrHe7R9tY95JdWVHFqozpyXlVPfeuIC
	4LiY+Jg1G/2uFNteko/2sRBqvkg4r9ZJvYSkAj/VUZrfYaGU1/DFbJe1Wy3rMc6dj8Y6
	GX2Q==
X-Gm-Message-State: APjAAAWXm5rXOlAdWHd0PF1GMSNEh6rzlLkcoT/TpOF8EW9qI3JrVy0f
	ZGaJr9bGyvvFrn6VutJRl57GkKFQHPMAjXBeTuK8cfALA7doJYMtBUz+VMRJgqNXqDYhwthoJWi
	a657bb+qzRbBYLvu6r4PIinnVJJKFRofnCxQzxQAliA==
X-Received: by 2002:a05:620a:12b6:: with SMTP id
	x22mr3187482qki.495.1569504390224; 
	Thu, 26 Sep 2019 06:26:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxOqinr5Q60U60VCr+5JVsP4K+bDRuObBU2H89+wefW4qdAMViXRd1NNdEtJnFrqVLkASlPsw==
X-Received: by 2002:a05:620a:12b6:: with SMTP id
	x22mr3187461qki.495.1569504389940; 
	Thu, 26 Sep 2019 06:26:29 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
	by smtp.gmail.com with ESMTPSA id c12sm968131qkc.81.2019.09.26.06.26.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Sep 2019 06:26:28 -0700 (PDT)
Date: Thu, 26 Sep 2019 09:26:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Tiwei Bie <tiwei.bie@intel.com>
Subject: Re: [PATCH] vhost: introduce mdev based hardware backend
Message-ID: <20190926091945-mutt-send-email-mst@kernel.org>
References: <20190926045427.4973-1-tiwei.bie@intel.com>
	<20190926042156-mutt-send-email-mst@kernel.org>
	<20190926131439.GA11652@___>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190926131439.GA11652@___>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, zhihong.wang@intel.com,
	virtualization@lists.linux-foundation.org,
	maxime.coquelin@redhat.com, netdev@vger.kernel.org, lingshan.zhu@intel.com
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

On Thu, Sep 26, 2019 at 09:14:39PM +0800, Tiwei Bie wrote:
> > 4. Does device need to limit max ring size?
> > 5. Does device need to limit max number of queues?
> 
> I think so. It's helpful to have ioctls to report the max
> ring size and max number of queues.

Also, let's not repeat the vhost net mistakes, let's lock
everything to the order required by the virtio spec,
checking status bits at each step.
E.g.:
	set backend features
	set features
	detect and program vqs
	enable vqs
	enable driver

and check status at each step to force the correct order.
e.g. don't allow enabling vqs after driver ok, etc

-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
