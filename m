Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4419343437
	for <lists.virtualization@lfdr.de>; Thu, 13 Jun 2019 10:40:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5AADE481;
	Thu, 13 Jun 2019 08:40:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 58FFD481
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 08:40:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 077A263D
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 08:40:04 +0000 (UTC)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x5D8dtNV102081 for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 04:40:04 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2t3jcfj64f-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 04:40:02 -0400
Received: from localhost
	by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<mimu@linux.ibm.com>; Thu, 13 Jun 2019 09:32:55 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
	by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 13 Jun 2019 09:32:52 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
	[9.149.105.59])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x5D8WoMj52232288
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 13 Jun 2019 08:32:50 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 659B5A404D;
	Thu, 13 Jun 2019 08:32:50 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4F75A405B;
	Thu, 13 Jun 2019 08:32:49 +0000 (GMT)
Received: from [9.152.97.224] (unknown [9.152.97.224])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 13 Jun 2019 08:32:49 +0000 (GMT)
Subject: Re: [PATCH v5 7/8] virtio/s390: use DMA memory for ccw I/O and
	classic notifiers
To: Halil Pasic <pasic@linux.ibm.com>, kvm@vger.kernel.org,
	linux-s390@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
	Sebastian Ott <sebott@linux.ibm.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>
References: <20190612111236.99538-1-pasic@linux.ibm.com>
	<20190612111236.99538-8-pasic@linux.ibm.com>
From: Michael Mueller <mimu@linux.ibm.com>
Organization: IBM
Date: Thu, 13 Jun 2019 10:32:49 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612111236.99538-8-pasic@linux.ibm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19061308-4275-0000-0000-00000341EE37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061308-4276-0000-0000-00003852070B
Message-Id: <902dbdb0-96c3-821c-6793-d7fb98e1f1e7@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-06-13_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1906130069
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
> Before virtio-ccw could get away with not using DMA API for the pieces of
> memory it does ccw I/O with. With protected virtualization this has to
> change, since the hypervisor needs to read and sometimes also write these
> pieces of memory.
> 
> The hypervisor is supposed to poke the classic notifiers, if these are
> used, out of band with regards to ccw I/O. So these need to be allocated
> as DMA memory (which is shared memory for protected virtualization
> guests).
> 
> Let us factor out everything from struct virtio_ccw_device that needs to
> be DMA memory in a satellite that is allocated as such.
> 
> Note: The control blocks of I/O instructions do not need to be shared.
> These are marshalled by the ultravisor.
> 
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   drivers/s390/virtio/virtio_ccw.c | 169 ++++++++++++++++---------------
>   1 file changed, 89 insertions(+), 80 deletions(-)
> 
> diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
> index e96a8cc56ec2..800252955a2f 100644
> --- a/drivers/s390/virtio/virtio_ccw.c
> +++ b/drivers/s390/virtio/virtio_ccw.c
> @@ -46,9 +46,15 @@ struct vq_config_block {
>   #define VIRTIO_CCW_CONFIG_SIZE 0x100
>   /* same as PCI config space size, should be enough for all drivers */
>   
> +struct vcdev_dma_area {
> +	unsigned long indicators;
> +	unsigned long indicators2;
> +	struct vq_config_block config_block;
> +	__u8 status;
> +};
> +
>   struct virtio_ccw_device {
>   	struct virtio_device vdev;
> -	__u8 *status;
>   	__u8 config[VIRTIO_CCW_CONFIG_SIZE];
>   	struct ccw_device *cdev;
>   	__u32 curr_io;
> @@ -58,24 +64,22 @@ struct virtio_ccw_device {
>   	spinlock_t lock;
>   	struct mutex io_lock; /* Serializes I/O requests */
>   	struct list_head virtqueues;
> -	unsigned long indicators;
> -	unsigned long indicators2;
> -	struct vq_config_block *config_block;
>   	bool is_thinint;
>   	bool going_away;
>   	bool device_lost;
>   	unsigned int config_ready;
>   	void *airq_info;
> +	struct vcdev_dma_area *dma_area;
>   };
>   
>   static inline unsigned long *indicators(struct virtio_ccw_device *vcdev)
>   {
> -	return &vcdev->indicators;
> +	return &vcdev->dma_area->indicators;
>   }
>   
>   static inline unsigned long *indicators2(struct virtio_ccw_device *vcdev)
>   {
> -	return &vcdev->indicators2;
> +	return &vcdev->dma_area->indicators2;
>   }
>   
>   struct vq_info_block_legacy {
> @@ -336,8 +340,8 @@ static void virtio_ccw_drop_indicator(struct virtio_ccw_device *vcdev,
>   	struct airq_info *airq_info = vcdev->airq_info;
>   
>   	if (vcdev->is_thinint) {
> -		thinint_area = kzalloc(sizeof(*thinint_area),
> -				       GFP_DMA | GFP_KERNEL);
> +		thinint_area = ccw_device_dma_zalloc(vcdev->cdev,
> +						     sizeof(*thinint_area));
>   		if (!thinint_area)
>   			return;
>   		thinint_area->summary_indicator =
> @@ -348,8 +352,8 @@ static void virtio_ccw_drop_indicator(struct virtio_ccw_device *vcdev,
>   		ccw->cda = (__u32)(unsigned long) thinint_area;
>   	} else {
>   		/* payload is the address of the indicators */
> -		indicatorp = kmalloc(sizeof(indicators(vcdev)),
> -				     GFP_DMA | GFP_KERNEL);
> +		indicatorp = ccw_device_dma_zalloc(vcdev->cdev,
> +						   sizeof(indicators(vcdev)));
>   		if (!indicatorp)
>   			return;
>   		*indicatorp = 0;
> @@ -369,8 +373,8 @@ static void virtio_ccw_drop_indicator(struct virtio_ccw_device *vcdev,
>   			 "Failed to deregister indicators (%d)\n", ret);
>   	else if (vcdev->is_thinint)
>   		virtio_ccw_drop_indicators(vcdev);
> -	kfree(indicatorp);
> -	kfree(thinint_area);
> +	ccw_device_dma_free(vcdev->cdev, indicatorp, sizeof(indicators(vcdev)));
> +	ccw_device_dma_free(vcdev->cdev, thinint_area, sizeof(*thinint_area));
>   }
>   
>   static inline long __do_kvm_notify(struct subchannel_id schid,
> @@ -417,15 +421,15 @@ static int virtio_ccw_read_vq_conf(struct virtio_ccw_device *vcdev,
>   {
>   	int ret;
>   
> -	vcdev->config_block->index = index;
> +	vcdev->dma_area->config_block.index = index;
>   	ccw->cmd_code = CCW_CMD_READ_VQ_CONF;
>   	ccw->flags = 0;
>   	ccw->count = sizeof(struct vq_config_block);
> -	ccw->cda = (__u32)(unsigned long)(vcdev->config_block);
> +	ccw->cda = (__u32)(unsigned long)(&vcdev->dma_area->config_block);
>   	ret = ccw_io_helper(vcdev, ccw, VIRTIO_CCW_DOING_READ_VQ_CONF);
>   	if (ret)
>   		return ret;
> -	return vcdev->config_block->num ?: -ENOENT;
> +	return vcdev->dma_area->config_block.num ?: -ENOENT;
>   }
>   
>   static void virtio_ccw_del_vq(struct virtqueue *vq, struct ccw1 *ccw)
> @@ -470,7 +474,8 @@ static void virtio_ccw_del_vq(struct virtqueue *vq, struct ccw1 *ccw)
>   			 ret, index);
>   
>   	vring_del_virtqueue(vq);
> -	kfree(info->info_block);
> +	ccw_device_dma_free(vcdev->cdev, info->info_block,
> +			    sizeof(*info->info_block));
>   	kfree(info);
>   }
>   
> @@ -480,7 +485,7 @@ static void virtio_ccw_del_vqs(struct virtio_device *vdev)
>   	struct ccw1 *ccw;
>   	struct virtio_ccw_device *vcdev = to_vc_device(vdev);
>   
> -	ccw = kzalloc(sizeof(*ccw), GFP_DMA | GFP_KERNEL);
> +	ccw = ccw_device_dma_zalloc(vcdev->cdev, sizeof(*ccw));
>   	if (!ccw)
>   		return;
>   
> @@ -489,7 +494,7 @@ static void virtio_ccw_del_vqs(struct virtio_device *vdev)
>   	list_for_each_entry_safe(vq, n, &vdev->vqs, list)
>   		virtio_ccw_del_vq(vq, ccw);
>   
> -	kfree(ccw);
> +	ccw_device_dma_free(vcdev->cdev, ccw, sizeof(*ccw));
>   }
>   
>   static struct virtqueue *virtio_ccw_setup_vq(struct virtio_device *vdev,
> @@ -512,8 +517,8 @@ static struct virtqueue *virtio_ccw_setup_vq(struct virtio_device *vdev,
>   		err = -ENOMEM;
>   		goto out_err;
>   	}
> -	info->info_block = kzalloc(sizeof(*info->info_block),
> -				   GFP_DMA | GFP_KERNEL);
> +	info->info_block = ccw_device_dma_zalloc(vcdev->cdev,
> +						 sizeof(*info->info_block));
>   	if (!info->info_block) {
>   		dev_warn(&vcdev->cdev->dev, "no info block\n");
>   		err = -ENOMEM;
> @@ -577,7 +582,8 @@ static struct virtqueue *virtio_ccw_setup_vq(struct virtio_device *vdev,
>   	if (vq)
>   		vring_del_virtqueue(vq);
>   	if (info) {
> -		kfree(info->info_block);
> +		ccw_device_dma_free(vcdev->cdev, info->info_block,
> +				    sizeof(*info->info_block));
>   	}
>   	kfree(info);
>   	return ERR_PTR(err);
> @@ -591,7 +597,8 @@ static int virtio_ccw_register_adapter_ind(struct virtio_ccw_device *vcdev,
>   	struct virtio_thinint_area *thinint_area = NULL;
>   	struct airq_info *info;
>   
> -	thinint_area = kzalloc(sizeof(*thinint_area), GFP_DMA | GFP_KERNEL);
> +	thinint_area = ccw_device_dma_zalloc(vcdev->cdev,
> +					     sizeof(*thinint_area));
>   	if (!thinint_area) {
>   		ret = -ENOMEM;
>   		goto out;
> @@ -627,7 +634,7 @@ static int virtio_ccw_register_adapter_ind(struct virtio_ccw_device *vcdev,
>   		virtio_ccw_drop_indicators(vcdev);
>   	}
>   out:
> -	kfree(thinint_area);
> +	ccw_device_dma_free(vcdev->cdev, thinint_area, sizeof(*thinint_area));
>   	return ret;
>   }
>   
> @@ -643,7 +650,7 @@ static int virtio_ccw_find_vqs(struct virtio_device *vdev, unsigned nvqs,
>   	int ret, i, queue_idx = 0;
>   	struct ccw1 *ccw;
>   
> -	ccw = kzalloc(sizeof(*ccw), GFP_DMA | GFP_KERNEL);
> +	ccw = ccw_device_dma_zalloc(vcdev->cdev, sizeof(*ccw));
>   	if (!ccw)
>   		return -ENOMEM;
>   
> @@ -667,7 +674,8 @@ static int virtio_ccw_find_vqs(struct virtio_device *vdev, unsigned nvqs,
>   	 * We need a data area under 2G to communicate. Our payload is
>   	 * the address of the indicators.
>   	*/
> -	indicatorp = kmalloc(sizeof(indicators(vcdev)), GFP_DMA | GFP_KERNEL);
> +	indicatorp = ccw_device_dma_zalloc(vcdev->cdev,
> +					   sizeof(indicators(vcdev)));
>   	if (!indicatorp)
>   		goto out;
>   	*indicatorp = (unsigned long) indicators(vcdev);
> @@ -699,12 +707,16 @@ static int virtio_ccw_find_vqs(struct virtio_device *vdev, unsigned nvqs,
>   	if (ret)
>   		goto out;
>   
> -	kfree(indicatorp);
> -	kfree(ccw);
> +	if (indicatorp)
> +		ccw_device_dma_free(vcdev->cdev, indicatorp,
> +				    sizeof(indicators(vcdev)));
> +	ccw_device_dma_free(vcdev->cdev, ccw, sizeof(*ccw));
>   	return 0;
>   out:
> -	kfree(indicatorp);
> -	kfree(ccw);
> +	if (indicatorp)
> +		ccw_device_dma_free(vcdev->cdev, indicatorp,
> +				    sizeof(indicators(vcdev)));
> +	ccw_device_dma_free(vcdev->cdev, ccw, sizeof(*ccw));
>   	virtio_ccw_del_vqs(vdev);
>   	return ret;
>   }
> @@ -714,12 +726,12 @@ static void virtio_ccw_reset(struct virtio_device *vdev)
>   	struct virtio_ccw_device *vcdev = to_vc_device(vdev);
>   	struct ccw1 *ccw;
>   
> -	ccw = kzalloc(sizeof(*ccw), GFP_DMA | GFP_KERNEL);
> +	ccw = ccw_device_dma_zalloc(vcdev->cdev, sizeof(*ccw));
>   	if (!ccw)
>   		return;
>   
>   	/* Zero status bits. */
> -	*vcdev->status = 0;
> +	vcdev->dma_area->status = 0;
>   
>   	/* Send a reset ccw on device. */
>   	ccw->cmd_code = CCW_CMD_VDEV_RESET;
> @@ -727,7 +739,7 @@ static void virtio_ccw_reset(struct virtio_device *vdev)
>   	ccw->count = 0;
>   	ccw->cda = 0;
>   	ccw_io_helper(vcdev, ccw, VIRTIO_CCW_DOING_RESET);
> -	kfree(ccw);
> +	ccw_device_dma_free(vcdev->cdev, ccw, sizeof(*ccw));
>   }
>   
>   static u64 virtio_ccw_get_features(struct virtio_device *vdev)
> @@ -738,11 +750,11 @@ static u64 virtio_ccw_get_features(struct virtio_device *vdev)
>   	u64 rc;
>   	struct ccw1 *ccw;
>   
> -	ccw = kzalloc(sizeof(*ccw), GFP_DMA | GFP_KERNEL);
> +	ccw = ccw_device_dma_zalloc(vcdev->cdev, sizeof(*ccw));
>   	if (!ccw)
>   		return 0;
>   
> -	features = kzalloc(sizeof(*features), GFP_DMA | GFP_KERNEL);
> +	features = ccw_device_dma_zalloc(vcdev->cdev, sizeof(*features));
>   	if (!features) {
>   		rc = 0;
>   		goto out_free;
> @@ -775,8 +787,8 @@ static u64 virtio_ccw_get_features(struct virtio_device *vdev)
>   		rc |= (u64)le32_to_cpu(features->features) << 32;
>   
>   out_free:
> -	kfree(features);
> -	kfree(ccw);
> +	ccw_device_dma_free(vcdev->cdev, features, sizeof(*features));
> +	ccw_device_dma_free(vcdev->cdev, ccw, sizeof(*ccw));
>   	return rc;
>   }
>   
> @@ -801,11 +813,11 @@ static int virtio_ccw_finalize_features(struct virtio_device *vdev)
>   		return -EINVAL;
>   	}
>   
> -	ccw = kzalloc(sizeof(*ccw), GFP_DMA | GFP_KERNEL);
> +	ccw = ccw_device_dma_zalloc(vcdev->cdev, sizeof(*ccw));
>   	if (!ccw)
>   		return -ENOMEM;
>   
> -	features = kzalloc(sizeof(*features), GFP_DMA | GFP_KERNEL);
> +	features = ccw_device_dma_zalloc(vcdev->cdev, sizeof(*features));
>   	if (!features) {
>   		ret = -ENOMEM;
>   		goto out_free;
> @@ -840,8 +852,8 @@ static int virtio_ccw_finalize_features(struct virtio_device *vdev)
>   	ret = ccw_io_helper(vcdev, ccw, VIRTIO_CCW_DOING_WRITE_FEAT);
>   
>   out_free:
> -	kfree(features);
> -	kfree(ccw);
> +	ccw_device_dma_free(vcdev->cdev, features, sizeof(*features));
> +	ccw_device_dma_free(vcdev->cdev, ccw, sizeof(*ccw));
>   
>   	return ret;
>   }
> @@ -855,11 +867,12 @@ static void virtio_ccw_get_config(struct virtio_device *vdev,
>   	void *config_area;
>   	unsigned long flags;
>   
> -	ccw = kzalloc(sizeof(*ccw), GFP_DMA | GFP_KERNEL);
> +	ccw = ccw_device_dma_zalloc(vcdev->cdev, sizeof(*ccw));
>   	if (!ccw)
>   		return;
>   
> -	config_area = kzalloc(VIRTIO_CCW_CONFIG_SIZE, GFP_DMA | GFP_KERNEL);
> +	config_area = ccw_device_dma_zalloc(vcdev->cdev,
> +					    VIRTIO_CCW_CONFIG_SIZE);
>   	if (!config_area)
>   		goto out_free;
>   
> @@ -881,8 +894,8 @@ static void virtio_ccw_get_config(struct virtio_device *vdev,
>   		memcpy(buf, config_area + offset, len);
>   
>   out_free:
> -	kfree(config_area);
> -	kfree(ccw);
> +	ccw_device_dma_free(vcdev->cdev, config_area, VIRTIO_CCW_CONFIG_SIZE);
> +	ccw_device_dma_free(vcdev->cdev, ccw, sizeof(*ccw));
>   }
>   
>   static void virtio_ccw_set_config(struct virtio_device *vdev,
> @@ -894,11 +907,12 @@ static void virtio_ccw_set_config(struct virtio_device *vdev,
>   	void *config_area;
>   	unsigned long flags;
>   
> -	ccw = kzalloc(sizeof(*ccw), GFP_DMA | GFP_KERNEL);
> +	ccw = ccw_device_dma_zalloc(vcdev->cdev, sizeof(*ccw));
>   	if (!ccw)
>   		return;
>   
> -	config_area = kzalloc(VIRTIO_CCW_CONFIG_SIZE, GFP_DMA | GFP_KERNEL);
> +	config_area = ccw_device_dma_zalloc(vcdev->cdev,
> +					    VIRTIO_CCW_CONFIG_SIZE);
>   	if (!config_area)
>   		goto out_free;
>   
> @@ -917,61 +931,61 @@ static void virtio_ccw_set_config(struct virtio_device *vdev,
>   	ccw_io_helper(vcdev, ccw, VIRTIO_CCW_DOING_WRITE_CONFIG);
>   
>   out_free:
> -	kfree(config_area);
> -	kfree(ccw);
> +	ccw_device_dma_free(vcdev->cdev, config_area, VIRTIO_CCW_CONFIG_SIZE);
> +	ccw_device_dma_free(vcdev->cdev, ccw, sizeof(*ccw));
>   }
>   
>   static u8 virtio_ccw_get_status(struct virtio_device *vdev)
>   {
>   	struct virtio_ccw_device *vcdev = to_vc_device(vdev);
> -	u8 old_status = *vcdev->status;
> +	u8 old_status = vcdev->dma_area->status;
>   	struct ccw1 *ccw;
>   
>   	if (vcdev->revision < 1)
> -		return *vcdev->status;
> +		return vcdev->dma_area->status;
>   
> -	ccw = kzalloc(sizeof(*ccw), GFP_DMA | GFP_KERNEL);
> +	ccw = ccw_device_dma_zalloc(vcdev->cdev, sizeof(*ccw));
>   	if (!ccw)
>   		return old_status;
>   
>   	ccw->cmd_code = CCW_CMD_READ_STATUS;
>   	ccw->flags = 0;
> -	ccw->count = sizeof(*vcdev->status);
> -	ccw->cda = (__u32)(unsigned long)vcdev->status;
> +	ccw->count = sizeof(vcdev->dma_area->status);
> +	ccw->cda = (__u32)(unsigned long)&vcdev->dma_area->status;
>   	ccw_io_helper(vcdev, ccw, VIRTIO_CCW_DOING_READ_STATUS);
>   /*
>    * If the channel program failed (should only happen if the device
>    * was hotunplugged, and then we clean up via the machine check
> - * handler anyway), vcdev->status was not overwritten and we just
> + * handler anyway), vcdev->dma_area->status was not overwritten and we just
>    * return the old status, which is fine.
>   */
> -	kfree(ccw);
> +	ccw_device_dma_free(vcdev->cdev, ccw, sizeof(*ccw));
>   
> -	return *vcdev->status;
> +	return vcdev->dma_area->status;
>   }
>   
>   static void virtio_ccw_set_status(struct virtio_device *vdev, u8 status)
>   {
>   	struct virtio_ccw_device *vcdev = to_vc_device(vdev);
> -	u8 old_status = *vcdev->status;
> +	u8 old_status = vcdev->dma_area->status;
>   	struct ccw1 *ccw;
>   	int ret;
>   
> -	ccw = kzalloc(sizeof(*ccw), GFP_DMA | GFP_KERNEL);
> +	ccw = ccw_device_dma_zalloc(vcdev->cdev, sizeof(*ccw));
>   	if (!ccw)
>   		return;
>   
>   	/* Write the status to the host. */
> -	*vcdev->status = status;
> +	vcdev->dma_area->status = status;
>   	ccw->cmd_code = CCW_CMD_WRITE_STATUS;
>   	ccw->flags = 0;
>   	ccw->count = sizeof(status);
> -	ccw->cda = (__u32)(unsigned long)vcdev->status;
> +	ccw->cda = (__u32)(unsigned long)&vcdev->dma_area->status;
>   	ret = ccw_io_helper(vcdev, ccw, VIRTIO_CCW_DOING_WRITE_STATUS);
>   	/* Write failed? We assume status is unchanged. */
>   	if (ret)
> -		*vcdev->status = old_status;
> -	kfree(ccw);
> +		vcdev->dma_area->status = old_status;
> +	ccw_device_dma_free(vcdev->cdev, ccw, sizeof(*ccw));
>   }
>   
>   static const char *virtio_ccw_bus_name(struct virtio_device *vdev)
> @@ -1004,8 +1018,8 @@ static void virtio_ccw_release_dev(struct device *_d)
>   	struct virtio_device *dev = dev_to_virtio(_d);
>   	struct virtio_ccw_device *vcdev = to_vc_device(dev);
>   
> -	kfree(vcdev->status);
> -	kfree(vcdev->config_block);
> +	ccw_device_dma_free(vcdev->cdev, vcdev->dma_area,
> +			    sizeof(*vcdev->dma_area));
>   	kfree(vcdev);
>   }
>   
> @@ -1213,12 +1227,12 @@ static int virtio_ccw_set_transport_rev(struct virtio_ccw_device *vcdev)
>   	struct ccw1 *ccw;
>   	int ret;
>   
> -	ccw = kzalloc(sizeof(*ccw), GFP_DMA | GFP_KERNEL);
> +	ccw = ccw_device_dma_zalloc(vcdev->cdev, sizeof(*ccw));
>   	if (!ccw)
>   		return -ENOMEM;
> -	rev = kzalloc(sizeof(*rev), GFP_DMA | GFP_KERNEL);
> +	rev = ccw_device_dma_zalloc(vcdev->cdev, sizeof(*rev));
>   	if (!rev) {
> -		kfree(ccw);
> +		ccw_device_dma_free(vcdev->cdev, ccw, sizeof(*ccw));
>   		return -ENOMEM;
>   	}
>   
> @@ -1248,8 +1262,8 @@ static int virtio_ccw_set_transport_rev(struct virtio_ccw_device *vcdev)
>   		}
>   	} while (ret == -EOPNOTSUPP);
>   
> -	kfree(ccw);
> -	kfree(rev);
> +	ccw_device_dma_free(vcdev->cdev, ccw, sizeof(*ccw));
> +	ccw_device_dma_free(vcdev->cdev, rev, sizeof(*rev));
>   	return ret;
>   }
>   
> @@ -1266,14 +1280,10 @@ static int virtio_ccw_online(struct ccw_device *cdev)
>   		goto out_free;
>   	}
>   	vcdev->vdev.dev.parent = &cdev->dev;
> -	vcdev->config_block = kzalloc(sizeof(*vcdev->config_block),
> -				   GFP_DMA | GFP_KERNEL);
> -	if (!vcdev->config_block) {
> -		ret = -ENOMEM;
> -		goto out_free;
> -	}
> -	vcdev->status = kzalloc(sizeof(*vcdev->status), GFP_DMA | GFP_KERNEL);
> -	if (!vcdev->status) {
> +	vcdev->cdev = cdev;
> +	vcdev->dma_area = ccw_device_dma_zalloc(vcdev->cdev,
> +						sizeof(*vcdev->dma_area));
> +	if (!vcdev->dma_area) {
>   		ret = -ENOMEM;
>   		goto out_free;
>   	}
> @@ -1282,7 +1292,6 @@ static int virtio_ccw_online(struct ccw_device *cdev)
>   
>   	vcdev->vdev.dev.release = virtio_ccw_release_dev;
>   	vcdev->vdev.config = &virtio_ccw_config_ops;
> -	vcdev->cdev = cdev;
>   	init_waitqueue_head(&vcdev->wait_q);
>   	INIT_LIST_HEAD(&vcdev->virtqueues);
>   	spin_lock_init(&vcdev->lock);
> @@ -1313,8 +1322,8 @@ static int virtio_ccw_online(struct ccw_device *cdev)
>   	return ret;
>   out_free:
>   	if (vcdev) {
> -		kfree(vcdev->status);
> -		kfree(vcdev->config_block);
> +		ccw_device_dma_free(vcdev->cdev, vcdev->dma_area,
> +				    sizeof(*vcdev->dma_area));
>   	}
>   	kfree(vcdev);
>   	return ret;
> 

Reviewed-by: Michael Mueller <mimu@linux.ibm.com>

Michael

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
