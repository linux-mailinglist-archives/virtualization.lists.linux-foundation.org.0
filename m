Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8922722746
	for <lists.virtualization@lfdr.de>; Sun, 19 May 2019 18:23:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 82A1CC37;
	Sun, 19 May 2019 16:17:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1F50F2385
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 13:43:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A9AC0837
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 13:43:32 +0000 (UTC)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4FDahsl063930 for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 09:43:31 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2sgjv0c87j-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 09:43:31 -0400
Received: from localhost
	by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<mimu@linux.ibm.com>; Wed, 15 May 2019 14:43:29 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
	by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Wed, 15 May 2019 14:43:26 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
	[9.149.105.232])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4FDhOZe46334144
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 15 May 2019 13:43:24 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 649E95204F;
	Wed, 15 May 2019 13:43:24 +0000 (GMT)
Received: from [9.152.99.219] (unknown [9.152.99.219])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id B2D4552050;
	Wed, 15 May 2019 13:43:23 +0000 (GMT)
Subject: Re: [PATCH 10/10] virtio/s390: make airq summary indicators DMA
To: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-11-pasic@linux.ibm.com>
	<20190513142010.36c8478f.cohuck@redhat.com>
From: Michael Mueller <mimu@linux.ibm.com>
Organization: IBM
Date: Wed, 15 May 2019 15:43:23 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190513142010.36c8478f.cohuck@redhat.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19051513-0008-0000-0000-000002E6F96B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051513-0009-0000-0000-000022539922
Message-Id: <3a8353e2-97e3-778e-ab2e-ef285ac7027d@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-15_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905150086
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Sun, 19 May 2019 16:17:22 +0000
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
	Sebastian Ott <sebott@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Farhan Ali <alifm@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
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



On 13.05.19 14:20, Cornelia Huck wrote:
> On Fri, 26 Apr 2019 20:32:45 +0200
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
>> Hypervisor needs to interact with the summary indicators, so these
>> need to be DMA memory as well (at least for protected virtualization
>> guests).
>>
>> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
>> ---
>>   drivers/s390/virtio/virtio_ccw.c | 24 +++++++++++++++++-------
>>   1 file changed, 17 insertions(+), 7 deletions(-)
> 
> (...)
> 
>> @@ -237,7 +243,8 @@ static void virtio_airq_handler(struct airq_struct *airq)
>>   	read_unlock(&info->lock);
>>   }
>>   
>> -static struct airq_info *new_airq_info(void)
>> +/* call with drivers/s390/virtio/virtio_ccw.cheld */
> 
> Hm, where is airq_areas_lock defined? If it was introduced in one of
> the previous patches, I have missed it.

There is no airq_areas_lock defined currently. My assumption is that
this will be used in context with the likely race condition this
part of the patch is talking about.

@@ -273,8 +281,9 @@ static unsigned long get_airq_indicator(struct 
virtqueue *vqs[], int nvqs,
  	unsigned long bit, flags;

  	for (i = 0; i < MAX_AIRQ_AREAS && !indicator_addr; i++) {
+		/* TODO: this seems to be racy */
  		if (!airq_areas[i])
-			airq_areas[i] = new_airq_info();
+			airq_areas[i] = new_airq_info(i);


As this shall be handled by a separate patch I will drop the comment
in regard to airq_areas_lock from this patch as well for v2.

Michael

> 
>> +static struct airq_info *new_airq_info(int index)
>>   {
>>   	struct airq_info *info;
>>   	int rc;
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
