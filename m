Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1252A1FB03E
	for <lists.virtualization@lfdr.de>; Tue, 16 Jun 2020 14:20:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B9C1B886DA;
	Tue, 16 Jun 2020 12:20:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mzOns+Y0Kb6F; Tue, 16 Jun 2020 12:20:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 24A8D886C4;
	Tue, 16 Jun 2020 12:20:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE103C016E;
	Tue, 16 Jun 2020 12:20:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48FCBC016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 12:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 316D989455
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 12:20:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id opMRYkCW0zDW
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 12:20:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E28C8884E7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 12:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592310022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=00I+rEnL5zfE1rppZBUcq4cMNwu7+BKdrw9mfoX5yzY=;
 b=WOBQSK7wj4ZBFfL7CD7PjwjG4goFKmbNSMvzERygIXWsCrNlSAPbKR6dRoCn/Ob1eJzlxL
 K5uh7MVS7ZL+fIWQN5VBeOaC0eEgbUQQjInoAGYdDxz/pHo1lh+0ODEBeFp5HXqBVLlnAC
 hBcuMASjk+AGlYwQ80/sae0eLmT0WfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-YKyVA7qMMvCdTaMTQoDbVg-1; Tue, 16 Jun 2020 08:20:20 -0400
X-MC-Unique: YKyVA7qMMvCdTaMTQoDbVg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DD41835B5A;
 Tue, 16 Jun 2020 12:20:18 +0000 (UTC)
Received: from gondolin (ovpn-112-222.ams2.redhat.com [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCE957CAA5;
 Tue, 16 Jun 2020 12:20:12 +0000 (UTC)
Date: Tue, 16 Jun 2020 14:20:10 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v2 1/1] s390: virtio: let arch accept devices without
 IOMMU feature
Message-ID: <20200616142010.04b7ba19.cohuck@redhat.com>
In-Reply-To: <ef235cc9-9d4b-1247-c01a-9dd1c63f437c@linux.ibm.com>
References: <1592224764-1258-1-git-send-email-pmorel@linux.ibm.com>
 <1592224764-1258-2-git-send-email-pmorel@linux.ibm.com>
 <20200616115202.0285aa08.pasic@linux.ibm.com>
 <ef235cc9-9d4b-1247-c01a-9dd1c63f437c@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 frankja@linux.ibm.com, kvm@vger.kernel.org, mst@redhat.com,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Halil Pasic <pasic@linux.ibm.com>, borntraeger@de.ibm.com,
 thomas.lendacky@amd.com, David Gibson <david@gibson.dropbear.id.au>
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

On Tue, 16 Jun 2020 12:52:50 +0200
Pierre Morel <pmorel@linux.ibm.com> wrote:

> On 2020-06-16 11:52, Halil Pasic wrote:
> > On Mon, 15 Jun 2020 14:39:24 +0200
> > Pierre Morel <pmorel@linux.ibm.com> wrote:

> >> @@ -162,6 +163,11 @@ bool force_dma_unencrypted(struct device *dev)
> >>   	return is_prot_virt_guest();
> >>   }
> >>   
> >> +int arch_needs_iommu_platform(struct virtio_device *dev)  
> > 
> > Maybe prefixing the name with virtio_ would help provide the
> > proper context.  
> 
> The virtio_dev makes it obvious and from the virtio side it should be 
> obvious that the arch is responsible for this.
> 
> However if nobody has something against I change it.

arch_needs_virtio_iommu_platform()?

> 
> >   
> >> +{
> >> +	return is_prot_virt_guest();
> >> +}
> >> +
> >>   /* protected virtualization */
> >>   static void pv_init(void)
> >>   {

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
