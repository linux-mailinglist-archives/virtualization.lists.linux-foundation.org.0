Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D20A22743
	for <lists.virtualization@lfdr.de>; Sun, 19 May 2019 18:22:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 902A1B6C;
	Sun, 19 May 2019 16:17:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8764CDAF
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 12:50:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6814327B
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 12:50:51 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4DChFIx147228 for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 08:50:50 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2sf8u80apf-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 08:50:50 -0400
Received: from localhost
	by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<mimu@linux.ibm.com>; Mon, 13 May 2019 13:50:48 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
	by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Mon, 13 May 2019 13:50:45 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4DCohaK52101178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 13 May 2019 12:50:43 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0EB942045;
	Mon, 13 May 2019 12:50:43 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DDB542049;
	Mon, 13 May 2019 12:50:43 +0000 (GMT)
Received: from [9.152.97.147] (unknown [9.152.97.147])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 13 May 2019 12:50:43 +0000 (GMT)
Subject: Re: [PATCH 04/10] s390/mm: force swiotlb for protected virtualization
To: Christian Borntraeger <borntraeger@de.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-5-pasic@linux.ibm.com>
	<20190426192711.GA31463@infradead.org>
	<20190429155951.3175fef5.pasic@linux.ibm.com>
	<3b9956a5-d8da-65fa-a2f7-4f54087d91d6@de.ibm.com>
From: Michael Mueller <mimu@linux.ibm.com>
Organization: IBM
Date: Mon, 13 May 2019 14:50:42 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3b9956a5-d8da-65fa-a2f7-4f54087d91d6@de.ibm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19051312-0016-0000-0000-0000027B266B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051312-0017-0000-0000-000032D7EB0E
Message-Id: <b80f9f39-73a9-de29-9b7a-c720bb7f215f@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-13_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=872 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905130090
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Sun, 19 May 2019 16:17:22 +0000
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
	Sebastian Ott <sebott@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Farhan Ali <alifm@linux.ibm.com>,
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



On 29.04.19 16:05, Christian Borntraeger wrote:
> 
> 
> On 29.04.19 15:59, Halil Pasic wrote:
>> On Fri, 26 Apr 2019 12:27:11 -0700
>> Christoph Hellwig <hch@infradead.org> wrote:
>>
>>> On Fri, Apr 26, 2019 at 08:32:39PM +0200, Halil Pasic wrote:
>>>> +EXPORT_SYMBOL_GPL(set_memory_encrypted);
>>>
>>>> +EXPORT_SYMBOL_GPL(set_memory_decrypted);
>>>
>>>> +EXPORT_SYMBOL_GPL(sev_active);
>>>
>>> Why do you export these?  I know x86 exports those as well, but
>>> it shoudn't be needed there either.
>>>
>>
>> I export these to be in line with the x86 implementation (which
>> is the original and seems to be the only one at the moment). I assumed
>> that 'exported or not' is kind of a part of the interface definition.
>> Honestly, I did not give it too much thought.
>>
>> For x86 set_memory(en|de)crypted got exported by 95cf9264d5f3 "x86, drm,
>> fbdev: Do not specify encrypted memory for video mappings" (Tom
>> Lendacky, 2017-07-17). With CONFIG_FB_VGA16=m seems to be necessary for x84.
>>
>> If the consensus is don't export: I won't. I'm fine one way or the other.
>> @Christian, what is your take on this?
> 
> If we do not need it today for anything (e.g. virtio-gpu) then we can get rid
> of the exports (and introduce them when necessary).

I'll take them out then.

>>
>> Thank you very much!
>>
>> Regards,
>> Halil
>>
>>
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
