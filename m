Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D4E5ED44F
	for <lists.virtualization@lfdr.de>; Wed, 28 Sep 2022 07:45:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 137EF60B5C;
	Wed, 28 Sep 2022 05:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 137EF60B5C
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kkMKeB6g
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id janroEGbwSKy; Wed, 28 Sep 2022 05:45:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 87202607F4;
	Wed, 28 Sep 2022 05:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87202607F4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A789FC0078;
	Wed, 28 Sep 2022 05:45:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54232C002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 28 Sep 2022 05:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DA8B404E5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 28 Sep 2022 05:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DA8B404E5
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=kkMKeB6g
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U0dTSAgAv5Y3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 28 Sep 2022 05:45:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86CF0402FE
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86CF0402FE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 28 Sep 2022 05:45:27 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28S56DgB008399;
 Wed, 28 Sep 2022 05:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=TRI7XAqpRChSCmHrdGbn7ZcUW1chuyOMvMEZsO5iOfM=;
 b=kkMKeB6gM2XwbxUMQI6Dv4jFR10HYXMzO3uNZUjeFiLyIeggvPCbsdNO4Lwxw5Bu01AE
 +EQVf4LVLLj1UANVQpC7TALUvhrNmdmAIx64zSLDzvc7gYnQn1jrOQ8I4DeqQeEQ85zR
 2VIuO06lwEosEi2uT1mCNZHXFyWDQ15yaarnwC6e2XAt7BO0odmij51xlFo9AQXpugwG
 Pd9XPydgTIrBIoLRGkfvp1sD2aVQHR2RPxPhrgLYxViKOeOV9/e2ZDlk+mEeqj1XFlyI
 OqcZN3XYr5S+NUr9Jk9WO1uF2m1Ez3HsASc7TnrZcf0HgSbewr2AkYl4qJGvNTOnc1vQ vQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jv8wpt8dv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 05:44:57 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28S56IV0009087;
 Wed, 28 Sep 2022 05:44:56 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jv8wpt8ct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 05:44:55 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28S5ZeV8005426;
 Wed, 28 Sep 2022 05:44:53 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3jssh9cr0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 05:44:53 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28S5ipT02490880
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Sep 2022 05:44:51 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F09514C040;
 Wed, 28 Sep 2022 05:44:50 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31A494C044;
 Wed, 28 Sep 2022 05:44:50 +0000 (GMT)
Received: from [9.171.2.29] (unknown [9.171.2.29])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 28 Sep 2022 05:44:50 +0000 (GMT)
Message-ID: <0e1259a7-a99d-ceb6-d73d-a3e3cf32d003@linux.ibm.com>
Date: Wed, 28 Sep 2022 07:44:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 6/6] freezer,sched: Rewrite core freezer logic
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>
References: <20220923072104.2013212-1-borntraeger@linux.ibm.com>
 <56576c3c-fe9b-59cf-95b8-158734320f24@linux.ibm.com>
 <b1d41989-7f4f-eb1d-db35-07a6f6b7a7f5@linux.ibm.com>
 <436fa401-e113-0393-f47a-ed23890364d7@linux.ibm.com>
 <39dfc425-deff-2469-7bcb-4a0e177b31d1@linux.ibm.com>
 <YzGhUZJKV3pKJL3Z@hirez.programming.kicks-ass.net>
 <66463973-923f-624d-3041-72ce76147b3e@linux.ibm.com>
 <YzGrJSLXpocpGIha@hirez.programming.kicks-ass.net>
 <9ec643f3-b935-0119-d8bc-1fbe46c36356@linux.ibm.com>
 <YzHqNiRj2Q5vxdCV@hirez.programming.kicks-ass.net>
 <YzHt2nG0Hb7xLlNj@hirez.programming.kicks-ass.net>
 <985463a3-5e33-95d2-b2bb-824707a2f819@linux.ibm.com>
In-Reply-To: <985463a3-5e33-95d2-b2bb-824707a2f819@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: C-iwwDbwObm8zSqeg3LDefvtdRzOtnJb
X-Proofpoint-GUID: 0cHj6lZcSCFBnzr0oV2OOul8RCx0NzuU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_02,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280032
Cc: vincent.guittot@linaro.org, linux-pm@vger.kernel.org, bigeasy@linutronix.de,
 Amit Shah <amit@kernel.org>, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, mingo@kernel.org, Marc Hartmayer <mhartmay@linux.ibm.com>,
 mgorman@suse.de, oleg@redhat.com, tj@kernel.org,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, will@kernel.org,
 dietmar.eggemann@arm.com, ebiederm@xmission.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>



Am 27.09.22 um 07:35 schrieb Christian Borntraeger:
> 
> 
> Am 26.09.22 um 20:22 schrieb Peter Zijlstra:
>> On Mon, Sep 26, 2022 at 08:06:46PM +0200, Peter Zijlstra wrote:
>>
>>> Let me go git-grep some to see if there's more similar fail.
>>
>> I've ended up with the below...
> 
> Tested-by: Christian Borntraeger <borntraeger@de.ibm.com>
> 
> Kind of scary that nobody else has reported any regression. I guess the freezable variant is just not used widely.

Will you queue this fix for next soon?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
