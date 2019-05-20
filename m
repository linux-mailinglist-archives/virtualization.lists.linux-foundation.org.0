Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF7723347
	for <lists.virtualization@lfdr.de>; Mon, 20 May 2019 14:13:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4E0F4CDE;
	Mon, 20 May 2019 12:13:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 86791CB8
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 12:13:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 18DDCA3
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 12:13:27 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4KCCJ8A129843 for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 08:13:26 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2sku2j2qxk-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 08:13:26 -0400
Received: from localhost
	by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pasic@linux.ibm.com>; Mon, 20 May 2019 13:13:23 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
	by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Mon, 20 May 2019 13:13:20 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
	[9.149.105.59])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4KCDIVm40829028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 20 May 2019 12:13:18 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8994CA404D;
	Mon, 20 May 2019 12:13:18 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B45B4A4051;
	Mon, 20 May 2019 12:13:17 +0000 (GMT)
Received: from oc2783563651 (unknown [9.145.57.34])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 20 May 2019 12:13:17 +0000 (GMT)
Date: Mon, 20 May 2019 14:13:12 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Sebastian Ott <sebott@linux.ibm.com>
Subject: Re: [PATCH 05/10] s390/cio: introduce DMA pools to cio
In-Reply-To: <alpine.LFD.2.21.1905161517570.1767@schleppi>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-6-pasic@linux.ibm.com>
	<alpine.LFD.2.21.1905081447280.1773@schleppi>
	<20190508232210.5a555caa.pasic@linux.ibm.com>
	<20190509121106.48aa04db.cohuck@redhat.com>
	<20190510001112.479b2fd7.pasic@linux.ibm.com>
	<20190510161013.7e697337.cohuck@redhat.com>
	<20190512202256.5517592d.pasic@linux.ibm.com>
	<alpine.LFD.2.21.1905161517570.1767@schleppi>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19052012-0020-0000-0000-0000033E90E0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052012-0021-0000-0000-0000219167C8
Message-Id: <20190520141312.4e3a2d36.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-20_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905200085
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Farhan Ali <alifm@linux.ibm.com>, linux-s390@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>, kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
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

On Thu, 16 May 2019 15:59:22 +0200 (CEST)
Sebastian Ott <sebott@linux.ibm.com> wrote:

> On Sun, 12 May 2019, Halil Pasic wrote:
> > I've also got code that deals with AIRQ_IV_CACHELINE by turning the
> > kmem_cache into a dma_pool.
> > 
> > Cornelia, Sebastian which approach do you prefer:
> > 1) get rid of cio_dma_pool and AIRQ_IV_CACHELINE, and waste a page per
> > vector, or
> > 2) go with the approach taken by the patch below?
> 
> We only have a couple of users for airq_iv:
> 
> virtio_ccw.c: 2K bits


You mean a single allocation is 2k bits (VIRTIO_IV_BITS = 256 * 8)? My
understanding is that the upper bound is more like:
MAX_AIRQ_AREAS * VIRTIO_IV_BITS = 20 * 256 * 8 = 40960 bits.

In practice it is most likely just 2k.

> 
> pci with floating IRQs: <= 2K (for the per-function bit vectors)
>                         1..4K (for the summary bit vector)
>

As far as I can tell with virtio_pci arch_setup_msi_irqs() gets called
once per device and allocates a small number of bits (2 and 3 in my
test, it may depend on #virtqueues, but I did not check).

So for an upper bound we would have to multiply with the upper bound of
pci devices/functions. What is the upper bound on the number of
functions?

> pci with CPU directed IRQs: 2K (for the per-CPU bit vectors)
>                             1..nr_cpu (for the summary bit vector)
> 

I guess this is the same.

> 
> The options are:
> * page allocations for everything

Worst case we need 20 + #max_pci_dev pages. At the moment we allocate
from ZONE_DMA (!) and waste a lot.

> * dma_pool for AIRQ_IV_CACHELINE ,gen_pool for others

I prefer this. Explanation follows.

> * dma_pool for everything
> 

Less waste by factor factor 16.

> I think we should do option 3 and use a dma_pool with cachesize
> alignment for everything (as a prerequisite we have to limit
> config PCI_NR_FUNCTIONS to 2K - but that is not a real constraint).
>

I prefer option 3 because it is conceptually the smallest change, and
provides the behavior which is closest to the current one.

Commit  414cbd1e3d14 "s390/airq: provide cacheline aligned
ivs" (Sebastian Ott, 2019-02-27) could have been smaller had you implemented
'kmem_cache for everything' (and I would have had just to replace kmem_cache with
dma_cache to achieve option 3). For some reason you decided to keep the
iv->vector = kzalloc(size, GFP_KERNEL) code-path and make the client code request
iv->vector = kmem_cache_zalloc(airq_iv_cache, GFP_KERNEL) explicitly, using a flag
which you only decided to use for directed pci irqs AFAICT.

My understanding of these decisions, and especially of the rationale
behind commit 414cbd1e3d14 is limited. Thus if option 3 is the way to
go, and the choices made by 414cbd1e3d14 were sub-optimal, I would feel
much more comfortable if you provided a patch that revises  and switches
everything to kmem_chache. I would then just swap kmem_cache out with a
dma_cache and my change would end up a straightforward and relatively
clean one.

So Sebastian, what shall we do?

Regards,
Halil




> Sebastian
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
