Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BA1BF427
	for <lists.virtualization@lfdr.de>; Thu, 26 Sep 2019 15:37:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 42EE4127D;
	Thu, 26 Sep 2019 13:37:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1282C11BA
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 13:37:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B46668A0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 13:37:14 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Sep 2019 06:37:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,552,1559545200"; d="scan'208";a="364730259"
Received: from dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.73])
	by orsmga005.jf.intel.com with ESMTP; 26 Sep 2019 06:37:11 -0700
Date: Thu, 26 Sep 2019 21:34:23 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] vhost: introduce mdev based hardware backend
Message-ID: <20190926133423.GA15574@___>
References: <20190926045427.4973-1-tiwei.bie@intel.com>
	<20190926042156-mutt-send-email-mst@kernel.org>
	<20190926131439.GA11652@___>
	<20190926091945-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190926091945-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
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

On Thu, Sep 26, 2019 at 09:26:22AM -0400, Michael S. Tsirkin wrote:
> On Thu, Sep 26, 2019 at 09:14:39PM +0800, Tiwei Bie wrote:
> > > 4. Does device need to limit max ring size?
> > > 5. Does device need to limit max number of queues?
> > 
> > I think so. It's helpful to have ioctls to report the max
> > ring size and max number of queues.
> 
> Also, let's not repeat the vhost net mistakes, let's lock
> everything to the order required by the virtio spec,
> checking status bits at each step.
> E.g.:
> 	set backend features
> 	set features
> 	detect and program vqs
> 	enable vqs
> 	enable driver
> 
> and check status at each step to force the correct order.
> e.g. don't allow enabling vqs after driver ok, etc

Got it. Thanks a lot!

Regards,
Tiwei

> 
> -- 
> MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
