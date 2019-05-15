Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EEA1F94B
	for <lists.virtualization@lfdr.de>; Wed, 15 May 2019 19:24:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A4F98CDE;
	Wed, 15 May 2019 17:24:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 47E7ECC8
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 17:24:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DE3428D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 17:24:29 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4FHN1FA095164 for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 13:24:28 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2sgnshm9mf-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 13:24:28 -0400
Received: from localhost
	by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pasic@linux.ibm.com>; Wed, 15 May 2019 18:24:26 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
	by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Wed, 15 May 2019 18:24:22 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
	[9.149.105.62])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4FHOLOm58065140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 15 May 2019 17:24:21 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E10E2AE056;
	Wed, 15 May 2019 17:24:20 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 156E4AE059;
	Wed, 15 May 2019 17:24:20 +0000 (GMT)
Received: from oc2783563651 (unknown [9.145.21.52])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 15 May 2019 17:24:20 +0000 (GMT)
Date: Wed, 15 May 2019 19:23:44 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Michael Mueller <mimu@linux.ibm.com>
Subject: Re: [PATCH 10/10] virtio/s390: make airq summary indicators DMA
In-Reply-To: <7c21b646-df27-88b6-6b06-3aab7887ff0a@linux.ibm.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-11-pasic@linux.ibm.com>
	<74ff9a63-891a-7e24-0865-8cc91a95cada@linux.ibm.com>
	<7c21b646-df27-88b6-6b06-3aab7887ff0a@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19051517-0016-0000-0000-0000027C1307
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051517-0017-0000-0000-000032D8E4CC
Message-Id: <20190515192344.5c57724c.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-15_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=760 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905150105
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
	Sebastian Ott <sebott@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, pmorel@linux.ibm.com,
	Cornelia Huck <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gV2VkLCAxNSBNYXkgMjAxOSAxNTozMzowMiArMDIwMApNaWNoYWVsIE11ZWxsZXIgPG1pbXVA
bGludXguaWJtLmNvbT4gd3JvdGU6Cgo+ID4+IEBAIC0yNzMsOCArMjgxLDkgQEAgc3RhdGljIHVu
c2lnbmVkIGxvbmcgZ2V0X2FpcnFfaW5kaWNhdG9yKHN0cnVjdCAKPiA+PiB2aXJ0cXVldWUgKnZx
c1tdLCBpbnQgbnZxcywKPiA+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgYml0LCBmbGFnczsK
PiA+PiDCoMKgwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBNQVhfQUlSUV9BUkVBUyAmJiAhaW5kaWNh
dG9yX2FkZHI7IGkrKykgewo+ID4+ICvCoMKgwqDCoMKgwqDCoCAvKiBUT0RPOiB0aGlzIHNlZW1z
IHRvIGJlIHJhY3kgKi8gIAo+ID4gCj4gPiB5ZXMsIG15IG9waW5pb25zIHRvbywgd2FzIGFscmVh
ZHkgcmFjeSwgaW4gbXkgb3Bpbmlvbiwgd2UgbmVlZCBhbm90aGVyIAo+ID4gcGF0Y2ggaW4gYW5v
dGhlciBzZXJpZXMgdG8gZml4IHRoaXMuCj4gPiAKPiA+IEhvd2V2ZXIsIG5vdCBzdXJlIGFib3V0
IHRoZSBjb21tZW50LiAgCj4gCj4gSSB3aWxsIGRyb3AgdGhpcyBjb21tZW50IGZvciB2MiBvZiB0
aGlzIHBhdGNoIHNlcmllcy4KPiBXZSBzaGFsbCBmaXggdGhlIHJhY2Ugd2l0aCBhIHNlcGFyYXRl
IHBhdGNoLgoKVW5sZXNzIHRoZXJlIGlzIHNvbWVib2R5IGVhZ2VyIHRvIGFkZHJlc3MgdGhpcyBy
ZWFsIHNvb24sIEkgd291bGQgcHJlZmVyCmtlZXBpbmcgdGhlIGNvbW1lbnQgYXMgYSByZW1pbmRl
ci4KClRoYW5rcyBmb3Igc2hvdWxkZXJpbmcgdGhlIHYyIQoKUmVnYXJkcywKSGFsaWwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
