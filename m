Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F3F2273C
	for <lists.virtualization@lfdr.de>; Sun, 19 May 2019 18:21:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 730A1A67;
	Sun, 19 May 2019 16:17:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 497A5DCB
	for <virtualization@lists.linux-foundation.org>;
	Thu,  9 May 2019 13:30:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D03D5709
	for <virtualization@lists.linux-foundation.org>;
	Thu,  9 May 2019 13:30:21 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x49DOGMF166528 for <virtualization@lists.linux-foundation.org>;
	Thu, 9 May 2019 09:30:20 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2sck39wx6t-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Thu, 09 May 2019 09:30:20 -0400
Received: from localhost
	by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pmorel@linux.ibm.com>; Thu, 9 May 2019 14:30:15 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
	by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 9 May 2019 14:30:11 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x49DU9wK33882182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 9 May 2019 13:30:09 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8827E4204D;
	Thu,  9 May 2019 13:30:09 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 98F5242054;
	Thu,  9 May 2019 13:30:08 +0000 (GMT)
Received: from [9.145.47.201] (unknown [9.145.47.201])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  9 May 2019 13:30:08 +0000 (GMT)
Subject: Re: [PATCH 09/10] virtio/s390: use DMA memory for ccw I/O and classic
	notifiers
From: Pierre Morel <pmorel@linux.ibm.com>
To: Halil Pasic <pasic@linux.ibm.com>, kvm@vger.kernel.org,
	linux-s390@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Sebastian Ott <sebott@linux.ibm.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-10-pasic@linux.ibm.com>
	<a873909a-9846-d6d3-f03e-e86d53fd9c75@linux.ibm.com>
Date: Thu, 9 May 2019 15:30:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a873909a-9846-d6d3-f03e-e86d53fd9c75@linux.ibm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19050913-0016-0000-0000-00000279F49B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050913-0017-0000-0000-000032D6A9C4
Message-Id: <db036887-c238-9795-5f47-cfeb475074e4@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905090081
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Sun, 19 May 2019 16:17:22 +0000
Cc: Thomas Huth <thuth@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Farhan Ali <alifm@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>,
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
Reply-To: pmorel@linux.ibm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gMDgvMDUvMjAxOSAxNjo0NiwgUGllcnJlIE1vcmVsIHdyb3RlOgo+IE9uIDI2LzA0LzIwMTkg
MjA6MzIsIEhhbGlsIFBhc2ljIHdyb3RlOgo+PiBCZWZvcmUgdmlydGlvLWNjdyBjb3VsZCBnZXQg
YXdheSB3aXRoIG5vdCB1c2luZyBETUEgQVBJIGZvciB0aGUgcGllY2VzIG9mCj4+IG1lbW9yeSBp
dCBkb2VzIGNjdyBJL08gd2l0aC4gV2l0aCBwcm90ZWN0ZWQgdmlydHVhbGl6YXRpb24gdGhpcyBo
YXMgdG8KPj4gY2hhbmdlLCBzaW5jZSB0aGUgaHlwZXJ2aXNvciBuZWVkcyB0byByZWFkIGFuZCBz
b21ldGltZXMgYWxzbyB3cml0ZSB0aGVzZQo+PiBwaWVjZXMgb2YgbWVtb3J5Lgo+Pgo+PiBUaGUg
aHlwZXJ2aXNvciBpcyBzdXBwb3NlZCB0byBwb2tlIHRoZSBjbGFzc2ljIG5vdGlmaWVycywgaWYg
dGhlc2UgYXJlCj4+IHVzZWQsIG91dCBvZiBiYW5kIHdpdGggcmVnYXJkcyB0byBjY3cgSS9PLiBT
byB0aGVzZSBuZWVkIHRvIGJlIGFsbG9jYXRlZAo+PiBhcyBETUEgbWVtb3J5ICh3aGljaCBpcyBz
aGFyZWQgbWVtb3J5IGZvciBwcm90ZWN0ZWQgdmlydHVhbGl6YXRpb24KPj4gZ3Vlc3RzKS4KPj4K
Pj4gTGV0IHVzIGZhY3RvciBvdXQgZXZlcnl0aGluZyBmcm9tIHN0cnVjdCB2aXJ0aW9fY2N3X2Rl
dmljZSB0aGF0IG5lZWRzIHRvCj4+IGJlIERNQSBtZW1vcnkgaW4gYSBzYXRlbGxpdGUgdGhhdCBp
cyBhbGxvY2F0ZWQgYXMgc3VjaC4KPj4KLi4uCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplb2YoaW5kaWNhdG9ycyh2Y2RldikpKTsKPiAKPiBzaG91
bGQgYmUgc2l6ZW9mKGxvbmcpID8KPiAKPiBUaGlzIGlzIGEgcmVjdXJyZW50IGVycm9yLCBidXQg
aXQgaXMgbm90IGFuIGlzc3VlIGJlY2F1c2UgdGhlIHNpemUgb2YKPiB0aGUgaW5kaWNhdG9ycyBp
cyB1bnNpZ25lZCBsb25nIGFzIHRoZSBzaXplIG9mIHRoZSBwb2ludGVyLgo+IAo+IFJlZ2FyZHMs
Cj4gUGllcnJlCj4gCgpIZXJlIHRvbywgd2l0aCB0aGUgcHJvYmxlbSBvZiB0aGUgaW5kaWNhdG9y
IHNpemUgaGFuZGxlZDoKUmV2aWV3ZWQtYnk6IFBpZXJyZSBNb3JlbDxwbW9yZWxAbGludXguaWJt
LmNvbT4KCgotLSAKUGllcnJlIE1vcmVsCkxpbnV4L0tWTS9RRU1VIGluIELDtmJsaW5nZW4gLSBH
ZXJtYW55CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpW
aXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vdmlydHVhbGl6YXRpb24=
