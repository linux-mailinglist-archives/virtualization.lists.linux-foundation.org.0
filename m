Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id BD33540DAFB
	for <lists.virtualization@lfdr.de>; Thu, 16 Sep 2021 15:18:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DCAE80B62;
	Thu, 16 Sep 2021 13:18:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d5n9QW9xos4j; Thu, 16 Sep 2021 13:18:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 227F083716;
	Thu, 16 Sep 2021 13:18:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C190C001E;
	Thu, 16 Sep 2021 13:18:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FBCCC000D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Sep 2021 13:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12B12605CF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Sep 2021 13:18:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ibm.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bK5bdbqcASBJ
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Sep 2021 13:18:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D77D8605D6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Sep 2021 13:18:45 +0000 (UTC)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18GD0N2m029064;
 Thu, 16 Sep 2021 09:18:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=oVkxofZeBhWFIRtnW0yTddOC+EkElRBzdsYHJchrF8g=;
 b=LyfQJtTQ7N7ml5O1J94ziPDSSstuoeGsKsSUJmAffjY0O2jGJSMZlM5gczlfsMwWo9eU
 YfaDSsIdAY2wlxrAofpdkjRzmAPdA29H8qehRd5ED2fpMLAF86H4x6Er/+ZuQS7Lh4az
 ocSJQiUmhHzXr+vXJCjz/le7MaG7NbzBLq93XRDKuR1sCiHg3ddL7srifQoWOas4sItl
 uR/7BFuvxgflRTKlrfReIVFSDeP0egl9NLCjw3Od+otFVu5fO950397JW4jQyVmwpxaj
 05pDAcNlTHjD8V7LQov11xgFxNVy0uX8WpzLJ9A+/4hqvel/oPEooTYgQ1yGvGU8hvlR ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b46e98fp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 09:18:44 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18GD1OKo031879;
 Thu, 16 Sep 2021 09:18:44 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b46e98fnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 09:18:43 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18GD8pdw004195;
 Thu, 16 Sep 2021 13:18:42 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3b0m39s268-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 13:18:42 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 18GDE27C58130854
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Sep 2021 13:14:02 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75E5E11C04A;
 Thu, 16 Sep 2021 13:18:38 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9D8D11C06E;
 Thu, 16 Sep 2021 13:18:37 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.66.107])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Sep 2021 13:18:37 +0000 (GMT)
Date: Thu, 16 Sep 2021 15:18:35 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 1/1] virtio/s390: fix vritio-ccw device teardown
Message-ID: <20210916151835.4ab512b2.pasic@linux.ibm.com>
In-Reply-To: <87pmt8hp5o.fsf@redhat.com>
References: <20210915215742.1793314-1-pasic@linux.ibm.com>
 <87pmt8hp5o.fsf@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SjFQ9cught4KPEvl1ldA4b5PUyKZbhTb
X-Proofpoint-ORIG-GUID: Fz25Jva0wLuz3n6TfQ6ZGY0_juWbeQm6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109160072
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 bfu@redhat.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, kvm@vger.kernel.org,
 Michael Mueller <mimu@linux.ibm.com>
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

On Thu, 16 Sep 2021 10:59:15 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> > Since commit 48720ba56891 ("virtio/s390: use DMA memory for ccw I/O and
> > classic notifiers") we were supposed to make sure that
> > virtio_ccw_release_dev() completes before the ccw device, and the
> > attached dma pool are torn down, but unfortunately we did not.
> > Before that commit it used to be OK to delay cleaning up the memory
> > allocated by virtio-ccw indefinitely (which isn't really intuitive for
> > guys used to destruction happens in reverse construction order).
> >
> > To accomplish this let us take a reference on the ccw device before we
> > allocate the dma_area and give it up after dma_area was freed.
> >
> > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > Fixes: 48720ba56891 ("virtio/s390: use DMA memory for ccw I/O and
> > classic notifiers")
> > Reported-by: bfu@redhat.com
> > ---
> >
> > I'm not certain this is the only hot-unplug and teardonw related problem
> > with virtio-ccw.
> >
> > Some things that are not perfectly clear to me:
> > * What would happen if we observed an hot-unplug while we are doing
> >   wait_event() in ccw_io_helper()? Do we get stuck? I don't thin we
> >   are guaranteed to receive an irq for a subchannel that is gone.  
> 
> Hm. I think we may need to do a wake_up during remove handling.

My guess is that the BQL is saving us from ever seeing this with QEMU
as the hypervisor-userspace. Nevertheless I don't think we should rely
on that. 

> 
> > * cdev->online seems to be manipulated under cdev->ccwlock, but
> >   in virtio_ccw_remove() we look at it to decide should we clean up
> >   or not. What is the idea there? I guess we want to avoid doing
> >   if nothing is there or twice. But I don't understand how stuff
> >   interlocks.  
> 
> We only created the virtio device when we onlined the ccw device. Do you
> have a better idea how to check for that? (And yes, I'm not sure the
> locking is correct.)
> 

Thanks, if I find time for it, I will try to understand this better and
come back with my findings.

> > * Can virtio_ccw_remove() get called while !cdev->online and 
> >   virtio_ccw_online() is running on a different cpu? If yes, what would
> >   happen then?  
> 
> All of the remove/online/... etc. callbacks are invoked via the ccw bus
> code. We have to trust that it gets it correct :) (Or have the common
> I/O layer maintainers double-check it.)
> 

Vineeth, what is your take on this? Are the struct ccw_driver
virtio_ccw_remove and the virtio_ccw_online callbacks mutually
exclusive. Please notice that we may initiate the onlining by
calling ccw_device_set_online() from a workqueue.

@Conny: I'm not sure what is your definition of 'it gets it correct'...
I doubt CIO can make things 100% foolproof in this area.

> >  
> > The main addresse of these questions is Conny ;).

In any case, I think we can go step by step. I would like the issue
this patch intends to address, addressed first. Then we can think
about the rest.

> >
> > An alternative to this approach would be to inc and dec the refcount
> > in ccw_device_dma_zalloc() and ccw_device_dma_free() respectively.  
> 
> Yeah, I also thought about that. This would give us more get/put
> operations, but might be the safer option.

My understanding is, that having the ccw device go away while in a
middle of doing ccw stuff (about to submit, or waiting for a channel
program, or whatever) was bad before. So my intuition tells me that
drivers should manage explicitly. Yes virtio_ccw happens to have dma
memory whose lifetime is more or less the lifetime of struct virtio_ccw,
but that may not be always the case.

Thanks for your comments!

Regards,
Halil

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
