Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DE6A6049
	for <lists.virtualization@lfdr.de>; Tue,  3 Sep 2019 06:39:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A8519AC8;
	Tue,  3 Sep 2019 04:39:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 459F19CA
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 04:39:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 05046709
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 04:39:26 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
	[209.85.160.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 87F3CC049E36
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 04:39:25 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id 38so17724509qtx.3
	for <virtualization@lists.linux-foundation.org>;
	Mon, 02 Sep 2019 21:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=QsFw6JbKR151rBeG65E8RZKx+pqxeiIfjKh1LzJnxMs=;
	b=FzdGLPYEw5I5GBCKHaqKcPA1ya9AekB+ZRN2Q6LRqlP+GkbSwgkNsXPxYLaFpcpr0m
	5ecVAe0oA7LjX8bNliOSZGFHSsUddh83+VfHiZv9jxtSkgXRFiECJV+jH9WuK2cIn+qN
	8QwL0n9xiB5ODAN/dmWSLJ37KGsdSYbAYq1rc/o2CpZqPk0Y+jxZCm1dpNyw+iaADjoo
	MC3LdPYqDTl3KMfVT3K9CjiKiUAfy4BK4steVZZBHb9R6ulj9CSTsg4ZFZeN4oAn9vec
	IpkH5+a6Ye+S6Q+uKWjM//kOBq39BBPPLuMHdCbVkXpqLCod6G6MH3Usk3WOlKZEOuiI
	xJPw==
X-Gm-Message-State: APjAAAUdFONYSB4QnDrK8Z8QkQndVpeh2IUwBcOw4VXhD0VriUMplNKh
	DKtdgx/CTBiBFBGmpluhD8yTV4zqdV/WgXk6LX6aA9NZ21R/L++yJpdjAVT4FmVwxFHR9DNlC29
	57DqTEZiDwm6MjCLBRyS31Mb9t9I3081H9NW6pCWI/w==
X-Received: by 2002:a37:7f41:: with SMTP id a62mr5242885qkd.21.1567485564946; 
	Mon, 02 Sep 2019 21:39:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwsb0LztYbIXObHR39awO6zBUHMeK0bLZrIDZ9QdvCXGsCAgbVutbSJHHLuwhraV6VG7qqbwA==
X-Received: by 2002:a37:7f41:: with SMTP id a62mr5242876qkd.21.1567485564780; 
	Mon, 02 Sep 2019 21:39:24 -0700 (PDT)
Received: from redhat.com (bzq-79-180-62-110.red.bezeqint.net. [79.180.62.110])
	by smtp.gmail.com with ESMTPSA id
	z72sm8508456qka.115.2019.09.02.21.39.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Sep 2019 21:39:24 -0700 (PDT)
Date: Tue, 3 Sep 2019 00:39:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v4 1/5] vsock/virtio: limit the memory used per-socket
Message-ID: <20190903003823-mutt-send-email-mst@kernel.org>
References: <20190729165056.r32uzj6om3o6vfvp@steredhat>
	<20190729143622-mutt-send-email-mst@kernel.org>
	<20190730093539.dcksure3vrykir3g@steredhat>
	<20190730163807-mutt-send-email-mst@kernel.org>
	<20190801104754.lb3ju5xjfmnxioii@steredhat>
	<20190801091106-mutt-send-email-mst@kernel.org>
	<20190801133616.sik5drn6ecesukbb@steredhat>
	<20190901025815-mutt-send-email-mst@kernel.org>
	<20190901061707-mutt-send-email-mst@kernel.org>
	<20190902095723.6vuvp73fdunmiogo@steredhat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190902095723.6vuvp73fdunmiogo@steredhat>
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

On Mon, Sep 02, 2019 at 11:57:23AM +0200, Stefano Garzarella wrote:
> > 
> > Assuming we miss nothing and buffers < 4K are broken,
> > I think we need to add this to the spec, possibly with
> > a feature bit to relax the requirement that all buffers
> > are at least 4k in size.
> > 
> 
> Okay, should I send a proposal to virtio-dev@lists.oasis-open.org?

How about we also fix the bug for now?

-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
