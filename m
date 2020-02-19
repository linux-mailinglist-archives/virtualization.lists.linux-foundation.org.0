Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB5E1648F0
	for <lists.virtualization@lfdr.de>; Wed, 19 Feb 2020 16:42:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2BEBE85E25;
	Wed, 19 Feb 2020 15:42:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P414ddDnwAPd; Wed, 19 Feb 2020 15:42:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6A5AA85E6E;
	Wed, 19 Feb 2020 15:42:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C047C1D81;
	Wed, 19 Feb 2020 15:42:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3940AC013E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 15:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2898B858F7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 15:42:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ey1TlFkBYyw2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 15:42:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 90E0884693
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 15:42:29 +0000 (UTC)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01JFZfqM115905 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 10:42:28 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y8ubvjadm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 10:42:28 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <virtualization@lists.linux-foundation.org> from <pasic@linux.ibm.com>;
 Wed, 19 Feb 2020 15:42:25 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 19 Feb 2020 15:42:21 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01JFgKeq20906272
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Feb 2020 15:42:20 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 494E74C046;
 Wed, 19 Feb 2020 15:42:20 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D27A94C040;
 Wed, 19 Feb 2020 15:42:19 +0000 (GMT)
Received: from oc2783563651 (unknown [9.152.98.43])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 Feb 2020 15:42:19 +0000 (GMT)
Date: Wed, 19 Feb 2020 16:42:18 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Ming Lei <tom.leiming@gmail.com>
Subject: Re: [PATCH 1/2] virtio-blk: fix hw_queue stopped on arbitrary error
In-Reply-To: <CACVXFVPBPCzr+sfQ4HOw1DNPGnEfp+5BLqQkXWQgkaBKqr3yVQ@mail.gmail.com>
References: <20200213123728.61216-1-pasic@linux.ibm.com>
 <20200213123728.61216-2-pasic@linux.ibm.com>
 <CACVXFVNiADTW_vLVc1bUSa0CoViLbVzoMnSJW4=sx=MCE-xUPw@mail.gmail.com>
 <20200218133531.3eb08120.pasic@linux.ibm.com>
 <CACVXFVPBPCzr+sfQ4HOw1DNPGnEfp+5BLqQkXWQgkaBKqr3yVQ@mail.gmail.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 20021915-0012-0000-0000-0000038853E3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021915-0013-0000-0000-000021C4E7E3
Message-Id: <20200219164218.6164cb17.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-19_03:2020-02-19,
 2020-02-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002190118
Cc: Jens Axboe <axboe@kernel.dk>, linux-s390 <linux-s390@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Ram Pai <linuxram@us.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 linux-block <linux-block@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>
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

On Wed, 19 Feb 2020 09:46:56 +0800
Ming Lei <tom.leiming@gmail.com> wrote:

> On Tue, Feb 18, 2020 at 8:35 PM Halil Pasic <pasic@linux.ibm.com> wrote:
> >
> > On Tue, 18 Feb 2020 10:21:18 +0800
> > Ming Lei <tom.leiming@gmail.com> wrote:
> >
> > > On Thu, Feb 13, 2020 at 8:38 PM Halil Pasic <pasic@linux.ibm.com> wrote:
> > > >
> > > > Since nobody else is going to restart our hw_queue for us, the
> > > > blk_mq_start_stopped_hw_queues() is in virtblk_done() is not sufficient
> > > > necessarily sufficient to ensure that the queue will get started again.
> > > > In case of global resource outage (-ENOMEM because mapping failure,
> > > > because of swiotlb full) our virtqueue may be empty and we can get
> > > > stuck with a stopped hw_queue.
> > > >
> > > > Let us not stop the queue on arbitrary errors, but only on -EONSPC which
> > > > indicates a full virtqueue, where the hw_queue is guaranteed to get
> > > > started by virtblk_done() before when it makes sense to carry on
> > > > submitting requests. Let us also remove a stale comment.
> > >
> > > The generic solution may be to stop queue only when there is any
> > > in-flight request
> > > not completed.
> > >
> >
> > I think this is a pretty close to that. The queue is stopped only on
> > ENOSPC, which means virtqueue is full.
> >
> > > Checking -ENOMEM may not be enough, given -EIO can be returned from
> > > virtqueue_add()
> > > too in case of dma map failure.
> >
> > I'm not checking on -ENOMEM. So the queue would not be stopped on EIO.
> > Maybe I'm misunderstanding something In any case, please have another
> > look at the diff, and if your concerns persist please help me understand.
> 
> Looks I misread the patch, and this patch is fine:
> 
> Reviewed-by: Ming Lei <ming.lei@redhat.com>

Thank you very much!

Regards,
Halil

> 
> 
> Thanks,
> Ming Lei

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
