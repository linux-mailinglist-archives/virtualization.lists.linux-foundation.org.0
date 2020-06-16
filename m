Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACCA1FB045
	for <lists.virtualization@lfdr.de>; Tue, 16 Jun 2020 14:21:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 454272045F;
	Tue, 16 Jun 2020 12:21:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zFLR53xmIDVm; Tue, 16 Jun 2020 12:21:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7BA8D2044A;
	Tue, 16 Jun 2020 12:21:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D505C016E;
	Tue, 16 Jun 2020 12:21:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0C66C016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 12:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BF8F08863D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 12:21:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3SBs4D98SK-F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 12:21:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 80C19885E4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 12:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592310085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h2SlXHGpqwt43th89psSAGozPMwGRRAsdb7ODXzU9w0=;
 b=gyr9sNwbPl+nXW49OIQ9ZaYti1hISkEEpiGS35C3Kd03CU/GVu2vS3sMzjXl2290fBfWAO
 i27GlZTqnVOzc5TCjmnaASC0Z8fvrBu1hM8mY9qVHhARjyCUMgIvEDlb+TD52Xu1EfuBwa
 PH3tBonHXZG0vg2jcRyXopyBpuF+rGU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-FYI6Xt7gPKyDGTLzv_M7uQ-1; Tue, 16 Jun 2020 08:21:21 -0400
X-MC-Unique: FYI6Xt7gPKyDGTLzv_M7uQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBB4B8005AD;
 Tue, 16 Jun 2020 12:21:19 +0000 (UTC)
Received: from gondolin (ovpn-112-222.ams2.redhat.com [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5AE31001B2B;
 Tue, 16 Jun 2020 12:21:14 +0000 (UTC)
Date: Tue, 16 Jun 2020 14:21:12 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v2 1/1] s390: virtio: let arch accept devices without
 IOMMU feature
Message-ID: <20200616142112.2d08ff7d.cohuck@redhat.com>
In-Reply-To: <a93bf169-55ca-2a77-f9a5-b27bf18176e2@linux.ibm.com>
References: <1592224764-1258-1-git-send-email-pmorel@linux.ibm.com>
 <1592224764-1258-2-git-send-email-pmorel@linux.ibm.com>
 <74b6cf8a-d5a6-e0bf-f1c1-e453af133614@de.ibm.com>
 <a93bf169-55ca-2a77-f9a5-b27bf18176e2@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: linux-s390@vger.kernel.org, frankja@linux.ibm.com, kvm@vger.kernel.org,
 mst@redhat.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 Christian Borntraeger <borntraeger@de.ibm.com>
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

On Tue, 16 Jun 2020 09:35:19 +0200
Pierre Morel <pmorel@linux.ibm.com> wrote:

> On 2020-06-16 08:55, Christian Borntraeger wrote:
> > 
> > 
> > On 15.06.20 14:39, Pierre Morel wrote:  
> >> An architecture protecting the guest memory against unauthorized host
> >> access may want to enforce VIRTIO I/O device protection through the
> >> use of VIRTIO_F_IOMMU_PLATFORM.
> >>
> >> Let's give a chance to the architecture to accept or not devices
> >> without VIRTIO_F_IOMMU_PLATFORM.
> >>
> >> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>  
> > 
> > 
> > Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>  
> 
> Thanks,
> 
> > 
> > Shouldnt we maybe add a pr_warn if that happens to help the admins to understand what is going on?
> > 
> >   
> 
> Yes, Connie asked for it too, good that you remind it to me, I add it.

Yes, please :)

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
