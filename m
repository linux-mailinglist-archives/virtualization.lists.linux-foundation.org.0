Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AE663BED49
	for <lists.virtualization@lfdr.de>; Thu, 26 Sep 2019 10:21:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 48E9FBA4;
	Thu, 26 Sep 2019 08:21:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B7C03B0B
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 08:21:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 556EC8CA
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 08:21:46 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
	[209.85.222.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C0000121D
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 08:21:45 +0000 (UTC)
Received: by mail-qk1-f199.google.com with SMTP id x77so1618947qka.11
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 01:21:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=hhU99cCB7XpvTN2fcxp8EjIrPOBFerG9ZEfadnPits4=;
	b=fgAlThrRr2Kw9Azx/pNpxBub4payuxi0ksY7OtMID8sv4WeNOD/uHk8lbCJGlT1aTK
	5zE9Ai8gpynh48mvFVlIg0rHHHBk5ArHzsQI7/i6BmulFn/3ZKTq0YdF9Ir9Tbn5Esxk
	o2HZylEfcT2b/+AombQaLn/bViKaUeE3tl/RoMpbEPkY9uEltmt/EXe6Xh+ucWgfprSt
	oVOpYwFi4AauuktaRTMKgV7c11UAGWqwe941CjwhBIyeFqP/AtJCiTf0PiX6G+wkENdP
	8Mojg0C3821AfWBBt72P55LlM+g9CNmEx0ryeC9hEZKZK/H9ymuwxgYRIy1C5M5K1deL
	1W2Q==
X-Gm-Message-State: APjAAAXJNhIAG5/83BfBOsGjcDunhQ/cde1oTE5ky9/jJwy9NDTV9uFS
	ALvNiBeXZ9nGRi7viyuBwOXWySBNa9ukqrxb5OFZy/B7X3WxQAkUi+BKou5xwYgVQha/bhyM1XI
	yxaEU7UZaW+AUclaTcanrNBMwggHFEZgygfOio3cplQ==
X-Received: by 2002:a37:d84:: with SMTP id 126mr1845513qkn.407.1569486105091; 
	Thu, 26 Sep 2019 01:21:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQ1sVd1RtjNN4RR2UjNtY+bztkqyrSkS/Hzvn/M5fL9tuYPUVoOD4Dv1RZQ64O49sodkiqzw==
X-Received: by 2002:a37:d84:: with SMTP id 126mr1845463qkn.407.1569486104789; 
	Thu, 26 Sep 2019 01:21:44 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
	by smtp.gmail.com with ESMTPSA id
	199sm632146qkk.112.2019.09.26.01.21.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Sep 2019 01:21:43 -0700 (PDT)
Date: Thu, 26 Sep 2019 04:21:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 6/8] mdev: introduce virtio device and its device ops
Message-ID: <20190926042102-mutt-send-email-mst@kernel.org>
References: <20190924135332.14160-1-jasowang@redhat.com>
	<20190924135332.14160-7-jasowang@redhat.com>
	<AADFC41AFE54684AB9EE6CBC0274A5D19D58F7DA@SHSMSX104.ccr.corp.intel.com>
	<2210d23d-38e4-e654-e53d-7867348de86a@redhat.com>
	<20190925092044-mutt-send-email-mst@kernel.org>
	<eb7c76b5-2938-2e73-d847-b174a289c5c9@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eb7c76b5-2938-2e73-d847-b174a289c5c9@redhat.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"airlied@linux.ie" <airlied@linux.ie>,
	"joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
	"heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
	"farman@linux.ibm.com" <farman@linux.ibm.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"kwankhede@nvidia.com" <kwankhede@nvidia.com>,
	"rob.miller@broadcom.com" <rob.miller@broadcom.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"sebott@linux.ibm.com" <sebott@linux.ibm.com>,
	"lulu@redhat.com" <lulu@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	"borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
	"haotian.wang@sifive.com" <haotian.wang@sifive.com>, "Wang,
	Zhi A" <zhi.a.wang@intel.com>, "idos@mellanox.com" <idos@mellanox.com>,
	"gor@linux.ibm.com" <gor@linux.ibm.com>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
	"Wang, Xiao W" <xiao.w.wang@intel.com>,
	"freude@linux.ibm.com" <freude@linux.ibm.com>,
	"zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
	"parav@mellanox.com" <parav@mellanox.com>, "Wang,
	Zhihong" <zhihong.wang@intel.com>, "Vivi,
	Rodrigo" <rodrigo.vivi@intel.com>, "intel-gvt-dev@lists.freedesktop.org"
	<intel-gvt-dev@lists.freedesktop.org>,
	"akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
	"oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "Zhu,
	Lingshan" <lingshan.zhu@intel.com>
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

On Thu, Sep 26, 2019 at 12:04:46PM +0800, Jason Wang wrote:
> > > > I'm not sure how stable above ops are.
> > > It's the kernel internal API, so there's no strict requirement for this. We
> > > will export a version value for userspace for compatibility.
> > Given it's tied to virtio we probably want kernel+userspace
> > feature bits?
> 
> 
> Yes, then I think we could probably have a version field inside e.g
> device_ops structure. Then it could be fetched from both kernel and
> userspace driver.
> 
> Thanks
> 


my point was feature bits not a version number.

> > 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
