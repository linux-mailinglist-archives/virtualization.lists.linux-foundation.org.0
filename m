Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 675A42B812
	for <lists.virtualization@lfdr.de>; Mon, 27 May 2019 17:02:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3E63419B9;
	Mon, 27 May 2019 15:02:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9D59A194E
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 15:01:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 242F86C5
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 15:01:21 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4REriN4099450 for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 11:01:21 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2srfh4r8dn-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 11:01:20 -0400
Received: from localhost
	by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<mimu@linux.ibm.com>; Mon, 27 May 2019 16:01:19 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
	by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Mon, 27 May 2019 16:01:14 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
	[9.149.105.232])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4RF1DN260096556
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 27 May 2019 15:01:13 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 499CDAA101;
	Mon, 27 May 2019 15:01:13 +0000 (GMT)
Received: from [9.152.98.56] (unknown [9.152.98.56])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id B6FA1AA0FD;
	Mon, 27 May 2019 15:01:12 +0000 (GMT)
Subject: Re: [PATCH v2 3/8] s390/cio: add basic protected virtualization
	support
To: Sebastian Ott <sebott@linux.ibm.com>
References: <20190523162209.9543-1-mimu@linux.ibm.com>
	<20190523162209.9543-4-mimu@linux.ibm.com>
	<alpine.LFD.2.21.1905251124230.3359@schleppi>
From: Michael Mueller <mimu@linux.ibm.com>
Organization: IBM
Date: Mon, 27 May 2019 17:01:12 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.1905251124230.3359@schleppi>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19052715-0016-0000-0000-0000027FF93D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052715-0017-0000-0000-000032DCFF66
Message-Id: <f2b8d5c3-a39b-8632-c463-cde47bf38c91@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-27_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905270106
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Farhan Ali <alifm@linux.ibm.com>,
	Linux-S390 Mailing List <linux-s390@vger.kernel.org>,
	Thomas Huth <thuth@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>, KVM Mailing List <kvm@vger.kernel.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Pierre Morel <pmorel@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Christoph Hellwig <hch@infradead.org>,
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
Reply-To: mimu@linux.ibm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org



On 25.05.19 11:44, Sebastian Ott wrote:
> 
> On Thu, 23 May 2019, Michael Mueller wrote:
>>   static struct ccw_device * io_subchannel_allocate_dev(struct subchannel *sch)
>>   {
>>   	struct ccw_device *cdev;
>> +	struct gen_pool *dma_pool;
>>   
>>   	cdev  = kzalloc(sizeof(*cdev), GFP_KERNEL);
>> -	if (cdev) {
>> -		cdev->private = kzalloc(sizeof(struct ccw_device_private),
>> -					GFP_KERNEL | GFP_DMA);
>> -		if (cdev->private)
>> -			return cdev;
>> -	}
>> +	if (!cdev)
>> +		goto err_cdev;
>> +	cdev->private = kzalloc(sizeof(struct ccw_device_private),
>> +				GFP_KERNEL | GFP_DMA);
>> +	if (!cdev->private)
>> +		goto err_priv;
>> +	cdev->dev.coherent_dma_mask = sch->dev.coherent_dma_mask;
>> +	cdev->dev.dma_mask = &cdev->dev.coherent_dma_mask;
>> +	dma_pool = cio_gp_dma_create(&cdev->dev, 1);
> 
> This can return NULL. gen_pool_alloc will panic in this case.
> [...]

yep, will handled in next version

> 
>> +err_dma_area:
>> +		kfree(io_priv);

one tab gone

> 
> Indentation.
> 
>> +err_priv:
>> +	put_device(&sch->dev);
>> +	return ERR_PTR(-ENOMEM);
>>   }
> [...]
>>   void ccw_device_update_sense_data(struct ccw_device *cdev)
>>   {
>>   	memset(&cdev->id, 0, sizeof(cdev->id));
>> -	cdev->id.cu_type   = cdev->private->senseid.cu_type;
>> -	cdev->id.cu_model  = cdev->private->senseid.cu_model;
>> -	cdev->id.dev_type  = cdev->private->senseid.dev_type;
>> -	cdev->id.dev_model = cdev->private->senseid.dev_model;
>> +	cdev->id.cu_type   =
>> +		cdev->private->dma_area->senseid.cu_type;
>> +	cdev->id.cu_model  =
>> +		cdev->private->dma_area->senseid.cu_model;
>> +	cdev->id.dev_type  =
>> +		cdev->private->dma_area->senseid.dev_type;
>> +	cdev->id.dev_model =
>> +		cdev->private->dma_area->senseid.dev_model;
> 
> These fit into one line.

yep, surprisingly below 80 characters

> 
>> +/**
>> + * Allocate zeroed dma coherent 31 bit addressable memory using
>> + * the subchannels dma pool. Maximal size of allocation supported
>> + * is PAGE_SIZE.
>> + */
> drivers/s390/cio/device_ops.c:708: warning: Function parameter or member 'cdev' not described in 'ccw_device_dma_zalloc'
> drivers/s390/cio/device_ops.c:708: warning: Function parameter or member 'size' not described in 'ccw_device_dma_zalloc'

changing comment open token

> 
> 
> Reviewed-by: Sebastian Ott <sebott@linux.ibm.com>
> 

Thanks!


Michael

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
