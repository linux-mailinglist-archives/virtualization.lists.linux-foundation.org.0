Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 78647427B8
	for <lists.virtualization@lfdr.de>; Wed, 12 Jun 2019 15:36:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id ACC381C3E;
	Wed, 12 Jun 2019 13:35:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 85F201B70
	for <virtualization@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 13:33:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0882CE6
	for <virtualization@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 13:33:49 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x5CDIW8c009216 for <virtualization@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 09:33:48 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2t31ac3jme-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 09:33:48 -0400
Received: from localhost
	by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pasic@linux.ibm.com>; Wed, 12 Jun 2019 14:33:46 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
	by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Wed, 12 Jun 2019 14:33:43 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
	[9.149.105.232])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x5CDXfLL27263206
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 12 Jun 2019 13:33:41 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB36252067;
	Wed, 12 Jun 2019 13:33:41 +0000 (GMT)
Received: from oc2783563651 (unknown [9.152.224.26])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 458F252054;
	Wed, 12 Jun 2019 13:33:41 +0000 (GMT)
Date: Wed, 12 Jun 2019 15:33:24 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v4 4/8] s390/airq: use DMA memory for adapter interrupts
In-Reply-To: <20190612082127.3fd63091.cohuck@redhat.com>
References: <20190606115127.55519-1-pasic@linux.ibm.com>
	<20190606115127.55519-5-pasic@linux.ibm.com>
	<20190611121721.61bf09b4.cohuck@redhat.com>
	<20190611162721.67ca8932.pasic@linux.ibm.com>
	<20190611181944.5bf2b953.cohuck@redhat.com>
	<20190612023231.7da4908c.pasic@linux.ibm.com>
	<20190612082127.3fd63091.cohuck@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19061213-0012-0000-0000-000003287F9E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061213-0013-0000-0000-000021618793
Message-Id: <20190612153324.3dc6632c.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-06-12_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=828 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1906120092
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
	Sebastian Ott <sebott@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Farhan Ali <alifm@linux.ibm.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	"Jason J. Herne" <jjherne@linux.ibm.com>,
	Michael Mueller <mimu@linux.ibm.com>,
	Viktor Mihajlovski <mihajlov@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>
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

On Wed, 12 Jun 2019 08:21:27 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Wed, 12 Jun 2019 02:32:31 +0200
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > On Tue, 11 Jun 2019 18:19:44 +0200
> > Cornelia Huck <cohuck@redhat.com> wrote:
> >   
> > > On Tue, 11 Jun 2019 16:27:21 +0200
> > > Halil Pasic <pasic@linux.ibm.com> wrote:  
> 
> > > > IMHO the cleanest thing to do at this stage is to check if the
> > > > airq_iv_cache is NULL and fail the allocation if it is (to preserve
> > > > previous behavior).    
> > > 
> > > That's probably the least invasive fix for now. Did you check whether
> > > any of the other dma pools this series introduces have a similar
> > > problem due to init not failing?
> > >    
> > 
> > Good question!
> > 
> > I did a quick check. virtio_ccw_init() should be OK, because we don't
> > register the driver if allocation fails, so the thing is going to end
> > up dysfunctional as expected.
> > 
> > If however cio_dma_pool_init() fails, then we end up with the same
> > problem with airqs, just on the !AIRQ_IV_CACHELINE code path. It can be
> > fixed analogously: make cio_dma_zalloc() fail all allocation if
> > cio_dma_pool_init() failed before.  
> 
> Ok, makes sense.

v5 is out with the fixes. I have no ack/r-b from you for patch 4. Would
you like to give some, or should I proceed without?

Regards,
Halil

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
