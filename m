Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CACA72CC5
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 13:01:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EECA8D3B;
	Wed, 24 Jul 2019 11:01:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A6E3ECDB
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 11:01:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3F6B3709
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 11:01:34 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x6OAvSYK005544 for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 07:01:33 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2txnw8gnfr-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 07:01:33 -0400
Received: from localhost
	by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pasic@linux.ibm.com>; Wed, 24 Jul 2019 12:01:30 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
	by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Wed, 24 Jul 2019 12:01:27 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
	[9.149.105.232])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x6OB1PAf47448152
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 24 Jul 2019 11:01:25 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 934A652059;
	Wed, 24 Jul 2019 11:01:25 +0000 (GMT)
Received: from oc2783563651 (unknown [9.152.224.141])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 53D9A52052;
	Wed, 24 Jul 2019 11:01:25 +0000 (GMT)
Date: Wed, 24 Jul 2019 13:01:24 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH 1/1] virtio/s390: fix race on airq_areas[]
In-Reply-To: <74087255-fdae-01a1-7152-f6fac8e13019@de.ibm.com>
References: <20190723225817.12800-1-pasic@linux.ibm.com>
	<74087255-fdae-01a1-7152-f6fac8e13019@de.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19072411-0028-0000-0000-000003875644
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072411-0029-0000-0000-00002447919D
Message-Id: <20190724130124.0dcfc5c0.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-07-24_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1906280000 definitions=main-1907240124
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
	kvm@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
	stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Marc Hartmayer <mhartmay@linux.ibm.com>
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

On Wed, 24 Jul 2019 08:44:19 +0200
Christian Borntraeger <borntraeger@de.ibm.com> wrote:

> 
> 
> On 24.07.19 00:58, Halil Pasic wrote:
> > The access to airq_areas was racy ever since the adapter interrupts got
> > introduced to virtio-ccw, but since commit 39c7dcb15892 ("virtio/s390:
> > make airq summary indicators DMA") this became an issue in practice as
> > well. Namely before that commit the airq_info that got overwritten was
> > still functional. After that commit however the two infos share a
> > summary_indicator, which aggravates the situation. Which means
> > auto-online mechanism occasionally hangs the boot with virtio_blk.
> > 
> > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > Reported-by: Marc Hartmayer <mhartmay@linux.ibm.com>
> > Fixes: 96b14536d935 ("virtio-ccw: virtio-ccw adapter interrupt support.")
> > ---
> > * We need definitely this fixed for 5.3. For older stable kernels it is
> > to be discussed. @Connie what do you think: do we need a cc stable?
> 
> Unless you can prove that the problem could never happen on old version
> we absolutely do need cc stable.

No I would not like to make an attempt at proving that. I prefer code
race free anyway. CC-ing stable.
 
> 
> > 
> > * I have a variant that does not need the extra mutex but uses cmpxchg().
> > Decided to post this one because that one is more complex. But if there
> > is interest we can have a look at it as well.
> 
> This is slow path (startup) and never called in hot path. Correct? Mutex should be
> fine.

Right, this is only relevant during device initialization, which is an
infrequent operation.

Thanks,
Halil

> > ---
> >  drivers/s390/virtio/virtio_ccw.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
> > index 1a55e5942d36..d97742662755 100644
> > --- a/drivers/s390/virtio/virtio_ccw.c
> > +++ b/drivers/s390/virtio/virtio_ccw.c
> > @@ -145,6 +145,8 @@ struct airq_info {
> >  	struct airq_iv *aiv;
> >  };
> >  static struct airq_info *airq_areas[MAX_AIRQ_AREAS];
> > +DEFINE_MUTEX(airq_areas_lock);
> > +
> >  static u8 *summary_indicators;
> >  
> >  static inline u8 *get_summary_indicator(struct airq_info *info)
> > @@ -265,9 +267,11 @@ static unsigned long get_airq_indicator(struct virtqueue *vqs[], int nvqs,
> >  	unsigned long bit, flags;
> >  
> >  	for (i = 0; i < MAX_AIRQ_AREAS && !indicator_addr; i++) {
> > +		mutex_lock(&airq_areas_lock);
> >  		if (!airq_areas[i])
> >  			airq_areas[i] = new_airq_info(i);
> >  		info = airq_areas[i];
> > +		mutex_unlock(&airq_areas_lock);
> >  		if (!info)
> >  			return 0;
> >  		write_lock_irqsave(&info->lock, flags);
> > 
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
