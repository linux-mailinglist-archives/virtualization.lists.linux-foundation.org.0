Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A15A33022
	for <lists.virtualization@lfdr.de>; Mon,  3 Jun 2019 14:47:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 10D65DC3;
	Mon,  3 Jun 2019 12:47:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 36CC9CD5
	for <virtualization@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 12:47:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B5B2D5D3
	for <virtualization@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 12:47:16 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x53CXVK7106469 for <virtualization@lists.linux-foundation.org>;
	Mon, 3 Jun 2019 08:47:15 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2sw2ptufqh-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Mon, 03 Jun 2019 08:47:15 -0400
Received: from localhost
	by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pasic@linux.ibm.com>; Mon, 3 Jun 2019 13:47:13 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
	by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Mon, 3 Jun 2019 13:47:10 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
	[9.149.105.62])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x53Cl88M61472880
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 3 Jun 2019 12:47:08 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 47C01AE04D;
	Mon,  3 Jun 2019 12:47:08 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AEC6FAE045;
	Mon,  3 Jun 2019 12:47:07 +0000 (GMT)
Received: from oc2783563651 (unknown [9.152.224.145])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon,  3 Jun 2019 12:47:07 +0000 (GMT)
Date: Mon, 3 Jun 2019 14:47:06 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v3 2/8] s390/cio: introduce DMA pools to cio
In-Reply-To: <20190603133745.240c00a7.cohuck@redhat.com>
References: <20190529122657.166148-1-mimu@linux.ibm.com>
	<20190529122657.166148-3-mimu@linux.ibm.com>
	<20190603133745.240c00a7.cohuck@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19060312-0012-0000-0000-000003225782
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060312-0013-0000-0000-0000215B318B
Message-Id: <20190603144706.2d458ccc.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-06-03_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1906030091
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vasily Gorbik <gor@linux.ibm.com>,
	Linux-S390 Mailing List <linux-s390@vger.kernel.org>,
	Thomas Huth <thuth@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
	KVM Mailing List <kvm@vger.kernel.org>,
	Sebastian Ott <sebott@linux.ibm.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Pierre Morel <pmorel@linux.ibm.com>, Farhan Ali <alifm@linux.ibm.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
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

On Mon, 3 Jun 2019 13:37:45 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Wed, 29 May 2019 14:26:51 +0200
> Michael Mueller <mimu@linux.ibm.com> wrote:
> 
> > From: Halil Pasic <pasic@linux.ibm.com>
> > 
> > To support protected virtualization cio will need to make sure the
> > memory used for communication with the hypervisor is DMA memory.
> > 
> > Let us introduce one global pool for cio.
> > 
> > Our DMA pools are implemented as a gen_pool backed with DMA pages. The
> > idea is to avoid each allocation effectively wasting a page, as we
> > typically allocate much less than PAGE_SIZE.
> > 
> > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > Reviewed-by: Sebastian Ott <sebott@linux.ibm.com>
> > Signed-off-by: Michael Mueller <mimu@linux.ibm.com>
> > ---
> >  arch/s390/Kconfig           |   1 +
> >  arch/s390/include/asm/cio.h |  11 ++++
> >  drivers/s390/cio/css.c      | 120 ++++++++++++++++++++++++++++++++++++++++++--
> >  3 files changed, 128 insertions(+), 4 deletions(-)
> 
> (...)
> 
> > diff --git a/arch/s390/include/asm/cio.h b/arch/s390/include/asm/cio.h
> > index 1727180e8ca1..43c007d2775a 100644
> > --- a/arch/s390/include/asm/cio.h
> > +++ b/arch/s390/include/asm/cio.h
> > @@ -328,6 +328,17 @@ static inline u8 pathmask_to_pos(u8 mask)
> >  void channel_subsystem_reinit(void);
> >  extern void css_schedule_reprobe(void);
> >  
> > +extern void *cio_dma_zalloc(size_t size);
> > +extern void cio_dma_free(void *cpu_addr, size_t size);
> > +extern struct device *cio_get_dma_css_dev(void);
> > +
> > +struct gen_pool;
> 
> That forward declaration is a bit ugly... 

Can you explain to me what is ugly about it so I can avoid similar
mistakes in the future?

>I guess the alternative was
> include hell?
> 

What do you mean by include hell?

I decided to use a forward declaration because the guys that include
"cio.h" are not expected to require the interfaces defined in
linux/genalloc.h. My motivation to do it like this was the principle of
encapsulation.

Regards,
Halil

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
