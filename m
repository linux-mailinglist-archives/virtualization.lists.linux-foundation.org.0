Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD562FDFF9
	for <lists.virtualization@lfdr.de>; Thu, 21 Jan 2021 04:15:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9FFFA8650D;
	Thu, 21 Jan 2021 03:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kH1MatXNY8U2; Thu, 21 Jan 2021 03:15:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B24CD863B2;
	Thu, 21 Jan 2021 03:15:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B528C013A;
	Thu, 21 Jan 2021 03:15:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0E23C013A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 03:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 97322863B2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 03:15:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d1CZutCY1I2w
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 03:15:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D2F4186130
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 03:15:03 +0000 (UTC)
IronPort-SDR: /jO7ynIRhhgy/blk0jCAYVwAYx361jB1DIJVHllC+O8HLOu0aBQnhUVz8wWcDiu+rP809r3T7D
 kuiiTsFWTazQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="178432466"
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; d="scan'208";a="178432466"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 19:15:03 -0800
IronPort-SDR: 7Q3oL1fgY6LpmQX4JGjQvhKC46uBpgTG9LFzfoVOhZv/tZZCGmDFgUq+HlPbDF7pFCzFWCz1iF
 bH2GUtW+z7/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; d="scan'208";a="391776714"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 20 Jan 2021 19:15:02 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 20 Jan 2021 19:15:02 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 20 Jan 2021 19:15:01 -0800
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.1713.004;
 Wed, 20 Jan 2021 19:15:01 -0800
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, "Tian, Kevin"
 <kevin.tian@intel.com>
Subject: RE: [RFC 3/3] vfio: Share the KVM instance with Vdmabuf
Thread-Topic: [RFC 3/3] vfio: Share the KVM instance with Vdmabuf
Thread-Index: AQHW7j6Sb7QSbmMgzEq63xXMOAt6Q6ovnEqA///v1aCAAKoggIAAJa6AgAAItACAAO9UUA==
Date: Thu, 21 Jan 2021 03:15:01 +0000
Message-ID: <04429d865db84e91ad72d9238ad9486b@intel.com>
References: <20210119082812.822291-1-vivek.kasireddy@intel.com>
 <20210119082812.822291-4-vivek.kasireddy@intel.com>
 <20210119083955.1cc9eae3@omen.home.shazbot.org>
 <b4a93e926d424ff199ab91ff88399087@intel.com>
 <20210119175057.5768b26b@x1.home.shazbot.org>
 <MWHPR11MB1886CC23DA5EF4695506AB308CA20@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210119203658.75d4e303@x1.home.shazbot.org>
In-Reply-To: <20210119203658.75d4e303@x1.home.shazbot.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
MIME-Version: 1.0
Cc: "Zhao, Yan Y" <yan.y.zhao@intel.com>, "Kim,
 Dongwon" <dongwon.kim@intel.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Hi Alex,

> -----Original Message-----
> From: Alex Williamson <alex.williamson@redhat.com>
> Sent: Tuesday, January 19, 2021 7:37 PM
> To: Tian, Kevin <kevin.tian@intel.com>
> Cc: Kasireddy, Vivek <vivek.kasireddy@intel.com>; Kim, Dongwon
> <dongwon.kim@intel.com>; virtualization@lists.linux-foundation.org; Zhao, Yan Y
> <yan.y.zhao@intel.com>
> Subject: Re: [RFC 3/3] vfio: Share the KVM instance with Vdmabuf
> 
> On Wed, 20 Jan 2021 03:05:49 +0000
> "Tian, Kevin" <kevin.tian@intel.com> wrote:
> 
> > > From: Alex Williamson
> > > Sent: Wednesday, January 20, 2021 8:51 AM
> > >
> > > On Wed, 20 Jan 2021 00:14:49 +0000
> > > "Kasireddy, Vivek" <vivek.kasireddy@intel.com> wrote:
> > >
> > > > Hi Alex,
> > > >
> > > > > -----Original Message-----
> > > > > From: Alex Williamson <alex.williamson@redhat.com>
> > > > > Sent: Tuesday, January 19, 2021 7:40 AM
> > > > > To: Kasireddy, Vivek <vivek.kasireddy@intel.com>
> > > > > Cc: virtualization@lists.linux-foundation.org; Kim, Dongwon
> > > <dongwon.kim@intel.com>
> > > > > Subject: Re: [RFC 3/3] vfio: Share the KVM instance with Vdmabuf
> > > > >
> > > > > On Tue, 19 Jan 2021 00:28:12 -0800
> > > > > Vivek Kasireddy <vivek.kasireddy@intel.com> wrote:
> > > > >
> > > > > > Getting a copy of the KVM instance is necessary for mapping Guest
> > > > > > pages in the Host.
> > > > > >
> > > > > > TODO: Instead of invoking the symbol directly, there needs to be a
> > > > > > better way of getting a copy of the KVM instance probably by using
> > > > > > other notifiers. However, currently, KVM shares its instance only
> > > > > > with VFIO and therefore we are compelled to bind the passthrough'd
> > > > > > device to vfio-pci.
> > > > >
> > > > > Yeah, this is a bad solution, sorry, vfio is not going to gratuitously
> > > > > call out to vhost to share a kvm pointer.  I'd prefer to get rid of
> > > > > vfio having any knowledge or visibility of the kvm pointer.  Thanks,
> > > >
> > > > [Kasireddy, Vivek] I agree that this is definitely not ideal as I recognize it
> > > > in the TODO. However, it looks like VFIO also gets a copy of the KVM
> > > > pointer in a similar manner:
> > > >
> > > > virt/kvm/vfio.c
> > > >
> > > > static void kvm_vfio_group_set_kvm(struct vfio_group *group, struct kvm
> > > *kvm)
> > > > {
> > > >         void (*fn)(struct vfio_group *, struct kvm *);
> > > >
> > > >         fn = symbol_get(vfio_group_set_kvm);
> > > >         if (!fn)
> > > >                 return;
> > > >
> > > >         fn(group, kvm);
> > > >
> > > >         symbol_put(vfio_group_set_kvm);
> > > > }
> > >
> > > You're equating the mechanism with the architecture.  We use symbols
> > > here to avoid module dependencies between kvm and vfio, but this is
> > > just propagating data that userspace is specifically registering
> > > between kvm and vfio.  vhost doesn't get to piggyback on that channel.
> > >
> > > > With this patch, I am not suggesting that this is a precedent that should be
> > > followed
> > > > but it appears there doesn't seem to be an alternative way of getting a copy
> > > of the KVM
> > > > pointer that is clean and elegant -- unless I have not looked hard enough. I
> > > guess we
> > > > could create a notifier chain with callbacks for VFIO and Vhost that KVM
> > > would call
> > > > but this would mean modifying KVM.
> > > >
> > > > Also, if I understand correctly, if VFIO does not want to share the KVM
> > > pointer with
> > > > VFIO groups, then I think it would break stuff like mdev which counts on it.
> > >
> > > Only kvmgt requires the kvm pointer and the use case there is pretty
> > > questionable, I wonder if it actually still exists now that we have the
> > > DMA r/w interface through vfio.  Thanks,
> > >
> >
> > IIRC, kvmgt still needs the kvm pointer to use kvm page tracking interface
> > for write-protecting guest pgtable.
> 
> Thanks, Kevin.  Either way, a vhost device has no stake in the game wrt
> the kvm pointer lifecycle here and no business adding a callout.  I'm
> reluctant to add any further use cases even for mdevs as ideally mdevs
> should have no dependency on kvm.  Thanks,

[Kasireddy, Vivek] All I am trying to do is leverage existing mechanism(s) 
instead of creating new ones. So, if Vhost cannot get the kvm pointer from 
VFIO in any manner, my only option, as it appears is to add a new 
notifier_block to KVM that gets triggered in kvm_create_vm() and 
kvm_destroy_vm(). However, I am not sure if that would be acceptable to 
the KVM maintainers. Does anyone know if there is another cleaner option 
available rather than having to modify KVM?

Thanks,
Vivek

> 
> Alex

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
