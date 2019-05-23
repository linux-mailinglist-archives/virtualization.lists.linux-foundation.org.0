Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E03B6280DA
	for <lists.virtualization@lfdr.de>; Thu, 23 May 2019 17:18:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1CB51F06;
	Thu, 23 May 2019 15:18:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4F4D7D39
	for <virtualization@lists.linux-foundation.org>;
	Thu, 23 May 2019 15:18:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CF2F3893
	for <virtualization@lists.linux-foundation.org>;
	Thu, 23 May 2019 15:18:06 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4NFHmDH081780 for <virtualization@lists.linux-foundation.org>;
	Thu, 23 May 2019 11:18:05 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2snurdyqej-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Thu, 23 May 2019 11:18:05 -0400
Received: from localhost
	by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pasic@linux.ibm.com>; Thu, 23 May 2019 16:18:03 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
	by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 23 May 2019 16:18:00 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
	[9.149.105.61])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4NFHwbW38731930
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 23 May 2019 15:17:58 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5FCEC11C052;
	Thu, 23 May 2019 15:17:58 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9159611C04A;
	Thu, 23 May 2019 15:17:57 +0000 (GMT)
Received: from oc2783563651 (unknown [9.145.30.80])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 23 May 2019 15:17:57 +0000 (GMT)
Date: Thu, 23 May 2019 17:17:56 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Sebastian Ott <sebott@linux.ibm.com>
Subject: Re: [PATCH 05/10] s390/cio: introduce DMA pools to cio
In-Reply-To: <alpine.LFD.2.21.1905081447280.1773@schleppi>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-6-pasic@linux.ibm.com>
	<alpine.LFD.2.21.1905081447280.1773@schleppi>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19052315-0008-0000-0000-000002E9B290
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052315-0009-0000-0000-0000225671DA
Message-Id: <20190523171756.4d30233a.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-23_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=889 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905230104
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
	Christian Borntraeger <borntraeger@de.ibm.com>,
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

On Wed, 8 May 2019 15:18:10 +0200 (CEST)
Sebastian Ott <sebott@linux.ibm.com> wrote:

> > @@ -224,6 +228,9 @@ struct subchannel *css_alloc_subchannel(struct subchannel_id schid,
> >  	INIT_WORK(&sch->todo_work, css_sch_todo);
> >  	sch->dev.release = &css_subchannel_release;
> >  	device_initialize(&sch->dev);
> > +	sch->dma_mask = css_dev_dma_mask;
> > +	sch->dev.dma_mask = &sch->dma_mask;
> > +	sch->dev.coherent_dma_mask = sch->dma_mask;  
> 
> Could we do:
> 	sch->dev.dma_mask = &sch->dev.coherent_dma_mask;
> 	sch->dev.coherent_dma_mask = css_dev_dma_mask;
> ?

Looks like a good idea to me. We will do it for all 3 (sch, ccw and
css). Thanks!

Regards,
Halil

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
