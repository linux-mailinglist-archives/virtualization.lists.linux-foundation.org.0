Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 727EDB5973
	for <lists.virtualization@lfdr.de>; Wed, 18 Sep 2019 03:54:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 58F34B59;
	Wed, 18 Sep 2019 01:54:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6FE3AB2F
	for <virtualization@lists.linux-foundation.org>;
	Wed, 18 Sep 2019 01:54:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 12067711
	for <virtualization@lists.linux-foundation.org>;
	Wed, 18 Sep 2019 01:54:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Sep 2019 18:54:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,519,1559545200"; d="scan'208";a="387759468"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
	by fmsmga006.fm.intel.com with ESMTP; 17 Sep 2019 18:54:46 -0700
Received: from fmsmsx112.amr.corp.intel.com (10.18.116.6) by
	FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Tue, 17 Sep 2019 18:54:46 -0700
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
	FMSMSX112.amr.corp.intel.com (10.18.116.6) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Tue, 17 Sep 2019 18:54:46 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.32]) by
	SHSMSX154.ccr.corp.intel.com ([169.254.7.195]) with mapi id
	14.03.0439.000; Wed, 18 Sep 2019 09:54:43 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Jason Wang
	<jasowang@redhat.com>
Subject: RE: [RFC PATCH 0/2] Mdev: support mutiple kinds of devices
Thread-Topic: [RFC PATCH 0/2] Mdev: support mutiple kinds of devices
Thread-Index: AQHVaU4oWR0pdyTYXkSIYprDpminDacvor2AgAER7xA=
Date: Wed, 18 Sep 2019 01:54:43 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D57B260@SHSMSX104.ccr.corp.intel.com>
References: <20190912094012.29653-1-jasowang@redhat.com>
	<20190917113125.6b2970e5@x1.home>
In-Reply-To: <20190917113125.6b2970e5@x1.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNjIzYjdjYjctNGRjNS00NjVkLWI1NjYtNmMzYjQ3NWFkZGVmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiOEtscnZOZHpwQlFVR2ZuQlowRGFUOXpKQmc3YzBGTVF1UGptQlFFYTRLWlhTYThac0hjRk55MTZGZDFXQ05KMiJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"mst@redhat.com" <mst@redhat.com>, "airlied@linux.ie" <airlied@linux.ie>,
	"joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
	"heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"kwankhede@nvidia.com" <kwankhede@nvidia.com>,
	"rob.miller@broadcom.com" <rob.miller@broadcom.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"sebott@linux.ibm.com" <sebott@linux.ibm.com>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	"borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"Wang, Zhi A" <zhi.a.wang@intel.com>,
	"farman@linux.ibm.com" <farman@linux.ibm.com>,
	"idos@mellanox.com" <idos@mellanox.com>,
	"gor@linux.ibm.com" <gor@linux.ibm.com>,
	"jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
	"Wang, Xiao W" <xiao.w.wang@intel.com>,
	"freude@linux.ibm.com" <freude@linux.ibm.com>,
	"zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
	Parav Pandit <parav@mellanox.com>, "Vivi,
	Rodrigo" <rodrigo.vivi@intel.com>, "intel-gvt-dev@lists.freedesktop.org"
	<intel-gvt-dev@lists.freedesktop.org>,
	"akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
	"pmorel@linux.ibm.com" <pmorel@linux.ibm.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "Wang, 
	Zhihong" <zhihong.wang@intel.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>
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

> From: Alex Williamson
> Sent: Wednesday, September 18, 2019 1:31 AM
> 
> [cc +Parav]
> 
> On Thu, 12 Sep 2019 17:40:10 +0800
> Jason Wang <jasowang@redhat.com> wrote:
> 
> > Hi all:
> >
> > During the development of virtio-mdev[1]. I find that mdev needs to be
> > extended to support devices other than vfio mdev device. So this
> > series tries to extend the mdev to be able to differ from different
> > devices by:
> >
> > - device id and matching for mdev bus
> > - device speicfic callbacks and move vfio callbacks there
> >
> > Sent for early reivew, compile test only!
> >
> > Thanks
> >
> > [1] https://lkml.org/lkml/2019/9/10/135
> 
> I expect Parav must have something similar in the works for their
> in-kernel networking mdev support.  Link to discussion so far:
> 
> https://lore.kernel.org/kvm/20190912094012.29653-1-
> jasowang@redhat.com/T/#t
> 

It links to the current thread. Is it intended or do you want
people to look at another thread driven by Parav? :-)

Thanks
Kevin

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
