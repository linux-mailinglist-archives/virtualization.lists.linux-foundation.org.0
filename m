Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C74D433FC
	for <lists.virtualization@lfdr.de>; Thu, 13 Jun 2019 10:14:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DA11E12C8;
	Thu, 13 Jun 2019 08:14:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 81248AF0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 08:13:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5505B174
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 08:13:58 +0000 (UTC)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x5D8C7fD002983 for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 04:13:57 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2t3jcfh4qr-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 04:13:57 -0400
Received: from localhost
	by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<mimu@linux.ibm.com>; Thu, 13 Jun 2019 09:13:54 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
	by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 13 Jun 2019 09:13:51 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
	[9.149.105.59])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x5D8DoeI57999430
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 13 Jun 2019 08:13:50 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DAD5DA4065;
	Thu, 13 Jun 2019 08:13:49 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 43682A4057;
	Thu, 13 Jun 2019 08:13:49 +0000 (GMT)
Received: from [9.152.97.224] (unknown [9.152.97.224])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 13 Jun 2019 08:13:49 +0000 (GMT)
Subject: Re: [PATCH v5 2/8] s390/cio: introduce DMA pools to cio
To: Halil Pasic <pasic@linux.ibm.com>, kvm@vger.kernel.org,
	linux-s390@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
	Sebastian Ott <sebott@linux.ibm.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>
References: <20190612111236.99538-1-pasic@linux.ibm.com>
	<20190612111236.99538-3-pasic@linux.ibm.com>
From: Michael Mueller <mimu@linux.ibm.com>
Organization: IBM
Date: Thu, 13 Jun 2019 10:13:48 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612111236.99538-3-pasic@linux.ibm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19061308-4275-0000-0000-00000341EC91
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061308-4276-0000-0000-000038520549
Message-Id: <4b0f7a77-25cd-65c3-5ec7-97c519d33fb2@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-06-13_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1906130066
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Jason J. Herne" <jjherne@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Farhan Ali <alifm@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Viktor Mihajlovski <mihajlov@linux.ibm.com>
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
Reply-To: mimu@linux.ibm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org



On 12.06.19 13:12, Halil Pasic wrote:
> To support protected virtualization cio will need to make sure the
> memory used for communication with the hypervisor is DMA memory.
> 
> Let us introduce one global pool for cio.
> 
> Our DMA pools are implemented as a gen_pool backed with DMA pages. The
> idea is to avoid each allocation effectively wasting a page, as we
> typically allocate much less than PAGE_SIZE.
> 
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> Reviewed-by: Sebastian Ott <sebott@linux.ibm.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   arch/s390/Kconfig           |   1 +
>   arch/s390/include/asm/cio.h |  11 +++
>   drivers/s390/cio/css.c      | 133 ++++++++++++++++++++++++++++++++++--
>   3 files changed, 141 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index 88d8355b7bf7..2a245b56db8b 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -191,6 +191,7 @@ config S390
>   	select ARCH_HAS_SCALED_CPUTIME
>   	select HAVE_NMI
>   	select SWIOTLB
> +	select GENERIC_ALLOCATOR
>   
>   
>   config SCHED_OMIT_FRAME_POINTER
> diff --git a/arch/s390/include/asm/cio.h b/arch/s390/include/asm/cio.h
> index 1727180e8ca1..58e7db912c30 100644
> --- a/arch/s390/include/asm/cio.h
> +++ b/arch/s390/include/asm/cio.h
> @@ -7,6 +7,7 @@
>   
>   #include <linux/spinlock.h>
>   #include <linux/bitops.h>
> +#include <linux/genalloc.h>
>   #include <asm/types.h>
>   
>   #define LPM_ANYPATH 0xff
> @@ -328,6 +329,16 @@ static inline u8 pathmask_to_pos(u8 mask)
>   void channel_subsystem_reinit(void);
>   extern void css_schedule_reprobe(void);
>   
> +extern void *cio_dma_zalloc(size_t size);
> +extern void cio_dma_free(void *cpu_addr, size_t size);
> +extern struct device *cio_get_dma_css_dev(void);
> +
> +void *cio_gp_dma_zalloc(struct gen_pool *gp_dma, struct device *dma_dev,
> +			size_t size);
> +void cio_gp_dma_free(struct gen_pool *gp_dma, void *cpu_addr, size_t size);
> +void cio_gp_dma_destroy(struct gen_pool *gp_dma, struct device *dma_dev);
> +struct gen_pool *cio_gp_dma_create(struct device *dma_dev, int nr_pages);
> +
>   /* Function from drivers/s390/cio/chsc.c */
>   int chsc_sstpc(void *page, unsigned int op, u16 ctrl, u64 *clock_delta);
>   int chsc_sstpi(void *page, void *result, size_t size);
> diff --git a/drivers/s390/cio/css.c b/drivers/s390/cio/css.c
> index aea502922646..e0f19f1e82a0 100644
> --- a/drivers/s390/cio/css.c
> +++ b/drivers/s390/cio/css.c
> @@ -20,6 +20,8 @@
>   #include <linux/reboot.h>
>   #include <linux/suspend.h>
>   #include <linux/proc_fs.h>
> +#include <linux/genalloc.h>
> +#include <linux/dma-mapping.h>
>   #include <asm/isc.h>
>   #include <asm/crw.h>
>   
> @@ -224,6 +226,12 @@ struct subchannel *css_alloc_subchannel(struct subchannel_id schid,
>   	INIT_WORK(&sch->todo_work, css_sch_todo);
>   	sch->dev.release = &css_subchannel_release;
>   	device_initialize(&sch->dev);
> +	/*
> +	 * The physical addresses of some the dma structures that can
> +	 * belong to a subchannel need to fit 31 bit width (e.g. ccw).
> +	 */
> +	sch->dev.coherent_dma_mask = DMA_BIT_MASK(31);
> +	sch->dev.dma_mask = &sch->dev.coherent_dma_mask;
>   	return sch;
>   
>   err:
> @@ -899,6 +907,13 @@ static int __init setup_css(int nr)
>   	dev_set_name(&css->device, "css%x", nr);
>   	css->device.groups = cssdev_attr_groups;
>   	css->device.release = channel_subsystem_release;
> +	/*
> +	 * We currently allocate notifier bits with this (using
> +	 * css->device as the device argument with the DMA API)
> +	 * and are fine with 64 bit addresses.
> +	 */
> +	css->device.coherent_dma_mask = DMA_BIT_MASK(64);
> +	css->device.dma_mask = &css->device.coherent_dma_mask;
>   
>   	mutex_init(&css->mutex);
>   	css->cssid = chsc_get_cssid(nr);
> @@ -1018,6 +1033,111 @@ static struct notifier_block css_power_notifier = {
>   	.notifier_call = css_power_event,
>   };
>   
> +#define  CIO_DMA_GFP (GFP_KERNEL | __GFP_ZERO)
> +static struct gen_pool *cio_dma_pool;
> +
> +/* Currently cio supports only a single css */
> +struct device *cio_get_dma_css_dev(void)
> +{
> +	return &channel_subsystems[0]->device;
> +}
> +
> +struct gen_pool *cio_gp_dma_create(struct device *dma_dev, int nr_pages)
> +{
> +	struct gen_pool *gp_dma;
> +	void *cpu_addr;
> +	dma_addr_t dma_addr;
> +	int i;
> +
> +	gp_dma = gen_pool_create(3, -1);
> +	if (!gp_dma)
> +		return NULL;
> +	for (i = 0; i < nr_pages; ++i) {
> +		cpu_addr = dma_alloc_coherent(dma_dev, PAGE_SIZE, &dma_addr,
> +					      CIO_DMA_GFP);
> +		if (!cpu_addr)
> +			return gp_dma;
> +		gen_pool_add_virt(gp_dma, (unsigned long) cpu_addr,
> +				  dma_addr, PAGE_SIZE, -1);
> +	}
> +	return gp_dma;
> +}
> +
> +static void __gp_dma_free_dma(struct gen_pool *pool,
> +			      struct gen_pool_chunk *chunk, void *data)
> +{
> +	size_t chunk_size = chunk->end_addr - chunk->start_addr + 1;
> +
> +	dma_free_coherent((struct device *) data, chunk_size,
> +			 (void *) chunk->start_addr,
> +			 (dma_addr_t) chunk->phys_addr);
> +}
> +
> +void cio_gp_dma_destroy(struct gen_pool *gp_dma, struct device *dma_dev)
> +{
> +	if (!gp_dma)
> +		return;
> +	/* this is quite ugly but no better idea */
> +	gen_pool_for_each_chunk(gp_dma, __gp_dma_free_dma, dma_dev);
> +	gen_pool_destroy(gp_dma);
> +}
> +
> +static int cio_dma_pool_init(void)
> +{
> +	/* No need to free up the resources: compiled in */
> +	cio_dma_pool = cio_gp_dma_create(cio_get_dma_css_dev(), 1);
> +	if (!cio_dma_pool)
> +		return -ENOMEM;
> +	return 0;
> +}
> +
> +void *cio_gp_dma_zalloc(struct gen_pool *gp_dma, struct device *dma_dev,
> +			size_t size)
> +{
> +	dma_addr_t dma_addr;
> +	unsigned long addr;
> +	size_t chunk_size;
> +
> +	if (!cio_dma_pool)
> +		return NULL;
> +	addr = gen_pool_alloc(gp_dma, size);
> +	while (!addr) {
> +		chunk_size = round_up(size, PAGE_SIZE);
> +		addr = (unsigned long) dma_alloc_coherent(dma_dev,
> +					 chunk_size, &dma_addr, CIO_DMA_GFP);
> +		if (!addr)
> +			return NULL;
> +		gen_pool_add_virt(gp_dma, addr, dma_addr, chunk_size, -1);
> +		addr = gen_pool_alloc(gp_dma, size);
> +	}
> +	return (void *) addr;
> +}
> +
> +void cio_gp_dma_free(struct gen_pool *gp_dma, void *cpu_addr, size_t size)
> +{
> +	if (!cpu_addr)
> +		return;
> +	memset(cpu_addr, 0, size);
> +	gen_pool_free(gp_dma, (unsigned long) cpu_addr, size);
> +}
> +
> +/*
> + * Allocate dma memory from the css global pool. Intended for memory not
> + * specific to any single device within the css. The allocated memory
> + * is not guaranteed to be 31-bit addressable.
> + *
> + * Caution: Not suitable for early stuff like console.
> + */
> +void *cio_dma_zalloc(size_t size)
> +{
> +	return cio_gp_dma_zalloc(cio_dma_pool, cio_get_dma_css_dev(), size);
> +}
> +
> +void cio_dma_free(void *cpu_addr, size_t size)
> +{
> +	cio_gp_dma_free(cio_dma_pool, cpu_addr, size);
> +}
> +
>   /*
>    * Now that the driver core is running, we can setup our channel subsystem.
>    * The struct subchannel's are created during probing.
> @@ -1059,16 +1179,21 @@ static int __init css_bus_init(void)
>   	if (ret)
>   		goto out_unregister;
>   	ret = register_pm_notifier(&css_power_notifier);
> -	if (ret) {
> -		unregister_reboot_notifier(&css_reboot_notifier);
> -		goto out_unregister;
> -	}
> +	if (ret)
> +		goto out_unregister_rn;
> +	ret = cio_dma_pool_init();
> +	if (ret)
> +		goto out_unregister_pmn;
>   	css_init_done = 1;
>   
>   	/* Enable default isc for I/O subchannels. */
>   	isc_register(IO_SCH_ISC);
>   
>   	return 0;
> +out_unregister_pmn:
> +	unregister_pm_notifier(&css_power_notifier);
> +out_unregister_rn:
> +	unregister_reboot_notifier(&css_reboot_notifier);
>   out_unregister:
>   	while (i-- > 0) {
>   		struct channel_subsystem *css = channel_subsystems[i];
> 

Reviewed-by: Michael Mueller <mimu@linux.ibm.com>

Michael

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
