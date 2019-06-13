Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4301443420
	for <lists.virtualization@lfdr.de>; Thu, 13 Jun 2019 10:29:47 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 39B67130E;
	Thu, 13 Jun 2019 08:29:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 21F0412D0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 08:29:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 868EA174
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 08:29:41 +0000 (UTC)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x5D8NI3o083773 for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 04:29:40 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2t3j5ajde4-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 04:29:40 -0400
Received: from localhost
	by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<mimu@linux.ibm.com>; Thu, 13 Jun 2019 09:29:38 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
	by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 13 Jun 2019 09:29:35 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
	[9.149.105.59])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x5D8TQxF30671314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 13 Jun 2019 08:29:26 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6972EA404D;
	Thu, 13 Jun 2019 08:29:33 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5FFBA4059;
	Thu, 13 Jun 2019 08:29:32 +0000 (GMT)
Received: from [9.152.97.224] (unknown [9.152.97.224])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 13 Jun 2019 08:29:32 +0000 (GMT)
Subject: Re: [PATCH v5 6/8] virtio/s390: add indirection to indicators access
To: Halil Pasic <pasic@linux.ibm.com>, kvm@vger.kernel.org,
	linux-s390@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
	Sebastian Ott <sebott@linux.ibm.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>
References: <20190612111236.99538-1-pasic@linux.ibm.com>
	<20190612111236.99538-7-pasic@linux.ibm.com>
From: Michael Mueller <mimu@linux.ibm.com>
Organization: IBM
Date: Thu, 13 Jun 2019 10:29:32 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612111236.99538-7-pasic@linux.ibm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19061308-0012-0000-0000-00000328BEE9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061308-0013-0000-0000-00002161C9D2
Message-Id: <caea5a6e-f174-7019-ce73-e9b52e20d50a@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-06-13_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1906130067
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
> This will come in handy soon when we pull out the indicators from
> virtio_ccw_device to a memory area that is shared with the hypervisor
> (in particular for protected virtualization guests).
> 
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   drivers/s390/virtio/virtio_ccw.c | 40 ++++++++++++++++++++------------
>   1 file changed, 25 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
> index 1da7430f94c8..e96a8cc56ec2 100644
> --- a/drivers/s390/virtio/virtio_ccw.c
> +++ b/drivers/s390/virtio/virtio_ccw.c
> @@ -68,6 +68,16 @@ struct virtio_ccw_device {
>   	void *airq_info;
>   };
>   
> +static inline unsigned long *indicators(struct virtio_ccw_device *vcdev)
> +{
> +	return &vcdev->indicators;
> +}
> +
> +static inline unsigned long *indicators2(struct virtio_ccw_device *vcdev)
> +{
> +	return &vcdev->indicators2;
> +}
> +
>   struct vq_info_block_legacy {
>   	__u64 queue;
>   	__u32 align;
> @@ -338,17 +348,17 @@ static void virtio_ccw_drop_indicator(struct virtio_ccw_device *vcdev,
>   		ccw->cda = (__u32)(unsigned long) thinint_area;
>   	} else {
>   		/* payload is the address of the indicators */
> -		indicatorp = kmalloc(sizeof(&vcdev->indicators),
> +		indicatorp = kmalloc(sizeof(indicators(vcdev)),
>   				     GFP_DMA | GFP_KERNEL);
>   		if (!indicatorp)
>   			return;
>   		*indicatorp = 0;
>   		ccw->cmd_code = CCW_CMD_SET_IND;
> -		ccw->count = sizeof(&vcdev->indicators);
> +		ccw->count = sizeof(indicators(vcdev));
>   		ccw->cda = (__u32)(unsigned long) indicatorp;
>   	}
>   	/* Deregister indicators from host. */
> -	vcdev->indicators = 0;
> +	*indicators(vcdev) = 0;
>   	ccw->flags = 0;
>   	ret = ccw_io_helper(vcdev, ccw,
>   			    vcdev->is_thinint ?
> @@ -657,10 +667,10 @@ static int virtio_ccw_find_vqs(struct virtio_device *vdev, unsigned nvqs,
>   	 * We need a data area under 2G to communicate. Our payload is
>   	 * the address of the indicators.
>   	*/
> -	indicatorp = kmalloc(sizeof(&vcdev->indicators), GFP_DMA | GFP_KERNEL);
> +	indicatorp = kmalloc(sizeof(indicators(vcdev)), GFP_DMA | GFP_KERNEL);
>   	if (!indicatorp)
>   		goto out;
> -	*indicatorp = (unsigned long) &vcdev->indicators;
> +	*indicatorp = (unsigned long) indicators(vcdev);
>   	if (vcdev->is_thinint) {
>   		ret = virtio_ccw_register_adapter_ind(vcdev, vqs, nvqs, ccw);
>   		if (ret)
> @@ -669,21 +679,21 @@ static int virtio_ccw_find_vqs(struct virtio_device *vdev, unsigned nvqs,
>   	}
>   	if (!vcdev->is_thinint) {
>   		/* Register queue indicators with host. */
> -		vcdev->indicators = 0;
> +		*indicators(vcdev) = 0;
>   		ccw->cmd_code = CCW_CMD_SET_IND;
>   		ccw->flags = 0;
> -		ccw->count = sizeof(&vcdev->indicators);
> +		ccw->count = sizeof(indicators(vcdev));
>   		ccw->cda = (__u32)(unsigned long) indicatorp;
>   		ret = ccw_io_helper(vcdev, ccw, VIRTIO_CCW_DOING_SET_IND);
>   		if (ret)
>   			goto out;
>   	}
>   	/* Register indicators2 with host for config changes */
> -	*indicatorp = (unsigned long) &vcdev->indicators2;
> -	vcdev->indicators2 = 0;
> +	*indicatorp = (unsigned long) indicators2(vcdev);
> +	*indicators2(vcdev) = 0;
>   	ccw->cmd_code = CCW_CMD_SET_CONF_IND;
>   	ccw->flags = 0;
> -	ccw->count = sizeof(&vcdev->indicators2);
> +	ccw->count = sizeof(indicators2(vcdev));
>   	ccw->cda = (__u32)(unsigned long) indicatorp;
>   	ret = ccw_io_helper(vcdev, ccw, VIRTIO_CCW_DOING_SET_CONF_IND);
>   	if (ret)
> @@ -1093,17 +1103,17 @@ static void virtio_ccw_int_handler(struct ccw_device *cdev,
>   			vcdev->err = -EIO;
>   	}
>   	virtio_ccw_check_activity(vcdev, activity);
> -	for_each_set_bit(i, &vcdev->indicators,
> -			 sizeof(vcdev->indicators) * BITS_PER_BYTE) {
> +	for_each_set_bit(i, indicators(vcdev),
> +			 sizeof(*indicators(vcdev)) * BITS_PER_BYTE) {
>   		/* The bit clear must happen before the vring kick. */
> -		clear_bit(i, &vcdev->indicators);
> +		clear_bit(i, indicators(vcdev));
>   		barrier();
>   		vq = virtio_ccw_vq_by_ind(vcdev, i);
>   		vring_interrupt(0, vq);
>   	}
> -	if (test_bit(0, &vcdev->indicators2)) {
> +	if (test_bit(0, indicators2(vcdev))) {
>   		virtio_config_changed(&vcdev->vdev);
> -		clear_bit(0, &vcdev->indicators2);
> +		clear_bit(0, indicators2(vcdev));
>   	}
>   }
>   
> 

Reviewed-by: Michael Mueller <mimu@linux.ibm.com>

Michael

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
