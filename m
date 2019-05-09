Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D2219034
	for <lists.virtualization@lfdr.de>; Thu,  9 May 2019 20:30:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 63E41E75;
	Thu,  9 May 2019 18:30:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C0BFBE67
	for <virtualization@lists.linux-foundation.org>;
	Thu,  9 May 2019 18:30:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6E2CC834
	for <virtualization@lists.linux-foundation.org>;
	Thu,  9 May 2019 18:30:40 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x49IN0Mq108418 for <virtualization@lists.linux-foundation.org>;
	Thu, 9 May 2019 14:30:40 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2scqtdc07d-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Thu, 09 May 2019 14:30:39 -0400
Received: from localhost
	by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pasic@linux.ibm.com>; Thu, 9 May 2019 19:30:37 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
	by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 9 May 2019 19:30:33 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
	[9.149.105.59])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x49IUV8038011016
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 9 May 2019 18:30:31 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3DE21A4059;
	Thu,  9 May 2019 18:30:31 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 64C96A4053;
	Thu,  9 May 2019 18:30:30 +0000 (GMT)
Received: from oc2783563651 (unknown [9.145.181.188])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  9 May 2019 18:30:30 +0000 (GMT)
Date: Thu, 9 May 2019 20:30:28 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH 09/10] virtio/s390: use DMA memory for ccw I/O and
	classic notifiers
In-Reply-To: <db036887-c238-9795-5f47-cfeb475074e4@linux.ibm.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-10-pasic@linux.ibm.com>
	<a873909a-9846-d6d3-f03e-e86d53fd9c75@linux.ibm.com>
	<db036887-c238-9795-5f47-cfeb475074e4@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19050918-0020-0000-0000-0000033B0534
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050918-0021-0000-0000-0000218DAD8C
Message-Id: <20190509203028.5b75eaa2.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=946 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905090105
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
	Sebastian Ott <sebott@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
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

T24gVGh1LCA5IE1heSAyMDE5IDE1OjMwOjA4ICswMjAwClBpZXJyZSBNb3JlbCA8cG1vcmVsQGxp
bnV4LmlibS5jb20+IHdyb3RlOgoKPiBPbiAwOC8wNS8yMDE5IDE2OjQ2LCBQaWVycmUgTW9yZWwg
d3JvdGU6Cj4gPiBPbiAyNi8wNC8yMDE5IDIwOjMyLCBIYWxpbCBQYXNpYyB3cm90ZToKPiA+PiBC
ZWZvcmUgdmlydGlvLWNjdyBjb3VsZCBnZXQgYXdheSB3aXRoIG5vdCB1c2luZyBETUEgQVBJIGZv
ciB0aGUgcGllY2VzIG9mCj4gPj4gbWVtb3J5IGl0IGRvZXMgY2N3IEkvTyB3aXRoLiBXaXRoIHBy
b3RlY3RlZCB2aXJ0dWFsaXphdGlvbiB0aGlzIGhhcyB0bwo+ID4+IGNoYW5nZSwgc2luY2UgdGhl
IGh5cGVydmlzb3IgbmVlZHMgdG8gcmVhZCBhbmQgc29tZXRpbWVzIGFsc28gd3JpdGUgdGhlc2UK
PiA+PiBwaWVjZXMgb2YgbWVtb3J5Lgo+ID4+Cj4gPj4gVGhlIGh5cGVydmlzb3IgaXMgc3VwcG9z
ZWQgdG8gcG9rZSB0aGUgY2xhc3NpYyBub3RpZmllcnMsIGlmIHRoZXNlIGFyZQo+ID4+IHVzZWQs
IG91dCBvZiBiYW5kIHdpdGggcmVnYXJkcyB0byBjY3cgSS9PLiBTbyB0aGVzZSBuZWVkIHRvIGJl
IGFsbG9jYXRlZAo+ID4+IGFzIERNQSBtZW1vcnkgKHdoaWNoIGlzIHNoYXJlZCBtZW1vcnkgZm9y
IHByb3RlY3RlZCB2aXJ0dWFsaXphdGlvbgo+ID4+IGd1ZXN0cykuCj4gPj4KPiA+PiBMZXQgdXMg
ZmFjdG9yIG91dCBldmVyeXRoaW5nIGZyb20gc3RydWN0IHZpcnRpb19jY3dfZGV2aWNlIHRoYXQg
bmVlZHMgdG8KPiA+PiBiZSBETUEgbWVtb3J5IGluIGEgc2F0ZWxsaXRlIHRoYXQgaXMgYWxsb2Nh
dGVkIGFzIHN1Y2guCj4gPj4KPiAuLi4KPiA+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc2l6ZW9mKGluZGljYXRvcnModmNkZXYpKSk7Cj4gPiAKPiA+IHNo
b3VsZCBiZSBzaXplb2YobG9uZykgPwoKSWYgc29tZXRoaW5nIGRpZmZlcmVudCB0aGVuIHNpemVv
Zih1NjQpIElNSE8uCj4gPiAKPiA+IFRoaXMgaXMgYSByZWN1cnJlbnQgZXJyb3IsIGJ1dCBpdCBp
cyBub3QgYW4gaXNzdWUgYmVjYXVzZSB0aGUgc2l6ZSBvZgo+ID4gdGhlIGluZGljYXRvcnMgaXMg
dW5zaWduZWQgbG9uZyBhcyB0aGUgc2l6ZSBvZiB0aGUgcG9pbnRlci4KCkkgZG9uJ3QgdGhpbmsg
dGhlcmUgaXMgYW4gZXJyb3IsIGxldCBhbG9uZSBhIHJlY3VycmVudCBvbmUuCgo+ID4gCj4gPiBS
ZWdhcmRzLAo+ID4gUGllcnJlCj4gPiAKPiAKPiBIZXJlIHRvbywgd2l0aCB0aGUgcHJvYmxlbSBv
ZiB0aGUgaW5kaWNhdG9yIHNpemUgaGFuZGxlZDoKCkkndmUgbGFpZCBvdXQgbXkgdmlldyBpbiBh
IHJlc3BvbnNlIHRvIHlvdXIgY29tbWVudCBvbiBwYXRjaCAjOC4KCj4gUmV2aWV3ZWQtYnk6IFBp
ZXJyZSBNb3JlbDxwbW9yZWxAbGludXguaWJtLmNvbT4KClRoYW5rcyEKSGFsaWwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
