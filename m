Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 238DAD2320
	for <lists.virtualization@lfdr.de>; Thu, 10 Oct 2019 10:47:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0948B101E;
	Thu, 10 Oct 2019 08:47:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C4EE61012
	for <virtualization@lists.linux-foundation.org>;
	Thu, 10 Oct 2019 08:47:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 869C15D3
	for <virtualization@lists.linux-foundation.org>;
	Thu, 10 Oct 2019 08:47:49 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
	[209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 088DAC050DEC
	for <virtualization@lists.linux-foundation.org>;
	Thu, 10 Oct 2019 08:47:49 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id w2so2415379wrn.4
	for <virtualization@lists.linux-foundation.org>;
	Thu, 10 Oct 2019 01:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=yMEA1vwAxxDR9KMsFNEltEDGLvMYr7N57Wh6Y66WRc0=;
	b=kf4vSGkeev6RhVEiCE+f6p1kIh6W0MhSfYIxhaHGEvNfB9JRS22YtPrKXckOzCoqXY
	v5yGqcBiYCpBAYN/bIrgcpy01+0FcnFjRLRmHDA7PCVu3zDMYVl+BKJ/V5VsoGB30rIi
	xV0tO++Iyqy789p7Q+jzY2SLDmw1G8hen/I1FJTFwCg+7sGM5qOqJE8kLk1RICmc0lZc
	htzaOxUPBVGonkfwgwi8Xfe8c4RTP1Oc0RRWxFvGWYzxhqu7fpFDcOxB2+UIEWspJJEy
	kXu2M6gDU+RR02TlhWGcCsaQhJfw6QtsQMOwjGFxFnUQHBCdL8CA9LBZgmxgJFyDXjx0
	zI6g==
X-Gm-Message-State: APjAAAWis0nGp5aVhZV2fyv/aMlztFwqnE3cjDhygo4MP3KsiI5Cgp+h
	ymlttTw99KjFesStRwKUPAzU6AsGyJOaikYz1qSOydFi+XZfLPLOCwbtEdlvhcBJG3Gl3eqkSyt
	4fI32SgRpiar2XnKkRxApdLCKD8aQfhEInGOMMQpOeA==
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr6460272wmk.135.1570697267773; 
	Thu, 10 Oct 2019 01:47:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwGlOe+0u6KXBMrN0A6Ztn9RSeVar+fTIwwT5kQa51LZTkc+efRSchIZ3bkrYo/CFxMwyo8bg==
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr6460257wmk.135.1570697267541; 
	Thu, 10 Oct 2019 01:47:47 -0700 (PDT)
Received: from steredhat (host174-200-dynamic.52-79-r.retail.telecomitalia.it.
	[79.52.200.174])
	by smtp.gmail.com with ESMTPSA id z9sm5103737wrp.26.2019.10.10.01.47.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 01:47:46 -0700 (PDT)
Date: Thu, 10 Oct 2019 10:47:44 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 07/11] VSOCK: add AF_VSOCK test cases
Message-ID: <20191010084744.n46t3ryv7rilkpk2@steredhat>
References: <20190801152541.245833-1-sgarzare@redhat.com>
	<20190801152541.245833-8-sgarzare@redhat.com>
	<CAGxU2F4N5ACePf6YLQCBFMHPu8wDLScF+AGQ2==JAuBUj0GB-A@mail.gmail.com>
	<20191009151503.GA13568@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009151503.GA13568@stefanha-x1.localdomain>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm <kvm@vger.kernel.org>, netdev@vger.kernel.org,
	Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	"David S. Miller" <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>
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

On Wed, Oct 09, 2019 at 04:15:03PM +0100, Stefan Hajnoczi wrote:
> On Wed, Oct 09, 2019 at 12:03:53PM +0200, Stefano Garzarella wrote:
> > Hi Stefan,
> > I'm thinking about dividing this test into single applications, one
> > for each test, do you think it makes sense?
> > Or is it just a useless complication?
> 
> I don't mind either way but personally I would leave it as a single
> program.
> 

Okay, since I had the doubt it was a useless complication and you prefer
a single application, I continue on this way :-)

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
