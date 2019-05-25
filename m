Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F972A3C2
	for <lists.virtualization@lfdr.de>; Sat, 25 May 2019 11:44:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 62B38DBC;
	Sat, 25 May 2019 09:44:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E382BDB1
	for <virtualization@lists.linux-foundation.org>;
	Sat, 25 May 2019 09:44:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6D34787B
	for <virtualization@lists.linux-foundation.org>;
	Sat, 25 May 2019 09:44:46 +0000 (UTC)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4P9h0vd103422 for <virtualization@lists.linux-foundation.org>;
	Sat, 25 May 2019 05:44:45 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2spyv54yvw-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Sat, 25 May 2019 05:44:45 -0400
Received: from localhost
	by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<sebott@linux.ibm.com>; Sat, 25 May 2019 10:44:43 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
	by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Sat, 25 May 2019 10:44:41 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
	[9.149.105.59])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4P9idZA42533104
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Sat, 25 May 2019 09:44:39 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 58CC9A4055;
	Sat, 25 May 2019 09:44:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 54223A404D;
	Sat, 25 May 2019 09:44:38 +0000 (GMT)
Received: from sig-9-145-26-217.uk.ibm.com (unknown [9.145.26.217])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Sat, 25 May 2019 09:44:38 +0000 (GMT)
Date: Sat, 25 May 2019 11:44:37 +0200 (CEST)
From: Sebastian Ott <sebott@linux.ibm.com>
X-X-Sender: sebott@schleppi
To: Michael Mueller <mimu@linux.ibm.com>
Subject: Re: [PATCH v2 3/8] s390/cio: add basic protected virtualization
	support
In-Reply-To: <20190523162209.9543-4-mimu@linux.ibm.com>
References: <20190523162209.9543-1-mimu@linux.ibm.com>
	<20190523162209.9543-4-mimu@linux.ibm.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
Organization: =?ISO-8859-15?Q?=22IBM_Deutschland_Research_&_Development_GmbH?=
	=?ISO-8859-15?Q?_=2F_Vorsitzende_des_Aufsichtsrats=3A_Matthias?=
	=?ISO-8859-15?Q?_Hartmann_Gesch=E4ftsf=FChrung=3A_Dirk_Wittkopp?=
	=?ISO-8859-15?Q?_Sitz_der_Gesellschaft=3A_B=F6blingen_=2F_Reg?=
	=?ISO-8859-15?Q?istergericht=3A_Amtsgericht_Stuttgart=2C_HRB_2432?=
	=?ISO-8859-15?Q?94=22?=
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19052509-0012-0000-0000-0000031F493A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052509-0013-0000-0000-000021580869
Message-Id: <alpine.LFD.2.21.1905251124230.3359@schleppi>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-25_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905250069
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


On Thu, 23 May 2019, Michael Mueller wrote:
>  static struct ccw_device * io_subchannel_allocate_dev(struct subchannel *sch)
>  {
>  	struct ccw_device *cdev;
> +	struct gen_pool *dma_pool;
>  
>  	cdev  = kzalloc(sizeof(*cdev), GFP_KERNEL);
> -	if (cdev) {
> -		cdev->private = kzalloc(sizeof(struct ccw_device_private),
> -					GFP_KERNEL | GFP_DMA);
> -		if (cdev->private)
> -			return cdev;
> -	}
> +	if (!cdev)
> +		goto err_cdev;
> +	cdev->private = kzalloc(sizeof(struct ccw_device_private),
> +				GFP_KERNEL | GFP_DMA);
> +	if (!cdev->private)
> +		goto err_priv;
> +	cdev->dev.coherent_dma_mask = sch->dev.coherent_dma_mask;
> +	cdev->dev.dma_mask = &cdev->dev.coherent_dma_mask;
> +	dma_pool = cio_gp_dma_create(&cdev->dev, 1);

This can return NULL. gen_pool_alloc will panic in this case.
[...]

> +err_dma_area:
> +		kfree(io_priv);

Indentation.

> +err_priv:
> +	put_device(&sch->dev);
> +	return ERR_PTR(-ENOMEM);
>  }
[...]
>  void ccw_device_update_sense_data(struct ccw_device *cdev)
>  {
>  	memset(&cdev->id, 0, sizeof(cdev->id));
> -	cdev->id.cu_type   = cdev->private->senseid.cu_type;
> -	cdev->id.cu_model  = cdev->private->senseid.cu_model;
> -	cdev->id.dev_type  = cdev->private->senseid.dev_type;
> -	cdev->id.dev_model = cdev->private->senseid.dev_model;
> +	cdev->id.cu_type   =
> +		cdev->private->dma_area->senseid.cu_type;
> +	cdev->id.cu_model  =
> +		cdev->private->dma_area->senseid.cu_model;
> +	cdev->id.dev_type  =
> +		cdev->private->dma_area->senseid.dev_type;
> +	cdev->id.dev_model =
> +		cdev->private->dma_area->senseid.dev_model;

These fit into one line.

> +/**
> + * Allocate zeroed dma coherent 31 bit addressable memory using
> + * the subchannels dma pool. Maximal size of allocation supported
> + * is PAGE_SIZE.
> + */
drivers/s390/cio/device_ops.c:708: warning: Function parameter or member 'cdev' not described in 'ccw_device_dma_zalloc'
drivers/s390/cio/device_ops.c:708: warning: Function parameter or member 'size' not described in 'ccw_device_dma_zalloc'


Reviewed-by: Sebastian Ott <sebott@linux.ibm.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
