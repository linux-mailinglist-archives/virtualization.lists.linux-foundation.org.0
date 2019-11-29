Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C9710D6A7
	for <lists.virtualization@lfdr.de>; Fri, 29 Nov 2019 15:09:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7C09F2043A;
	Fri, 29 Nov 2019 14:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HbTiQmReZXnH; Fri, 29 Nov 2019 14:09:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9D0C620380;
	Fri, 29 Nov 2019 14:09:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88764C0881;
	Fri, 29 Nov 2019 14:09:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0F8AC0881
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Nov 2019 14:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B96E12043A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Nov 2019 14:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w0TzaJ9wlxP2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Nov 2019 14:09:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by silver.osuosl.org (Postfix) with ESMTPS id 328DF20380
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Nov 2019 14:09:53 +0000 (UTC)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xATE2bhc051189 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Nov 2019 09:09:51 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wjuwh9t0y-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Nov 2019 09:09:51 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <virtualization@lists.linux-foundation.org> from <pasic@linux.ibm.com>;
 Fri, 29 Nov 2019 14:09:48 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 29 Nov 2019 14:09:44 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xATE9h6h50200654
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Nov 2019 14:09:43 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAAF011C05E;
 Fri, 29 Nov 2019 14:09:42 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7816511C050;
 Fri, 29 Nov 2019 14:09:42 +0000 (GMT)
Received: from oc2783563651 (unknown [9.152.224.151])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 Nov 2019 14:09:42 +0000 (GMT)
Date: Fri, 29 Nov 2019 15:09:41 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/1] virtio_ring: fix return code on DMA mapping fails
In-Reply-To: <20191126184527.GA10481@lst.de>
References: <20191114124646.74790-1-pasic@linux.ibm.com>
 <20191119121022.03aed69a.pasic@linux.ibm.com>
 <20191119080420-mutt-send-email-mst@kernel.org>
 <20191122140827.0ead345c.pasic@linux.ibm.com>
 <1ec7c229-6c4f-9351-efda-ed2df20f95f6@amd.com>
 <20191126184527.GA10481@lst.de>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19112914-4275-0000-0000-000003880D13
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112914-4276-0000-0000-0000389BA270
Message-Id: <20191129150941.34cab07a.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-29_04:2019-11-29,2019-11-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911290123
Cc: Tom Lendacky <thomas.lendacky@amd.com>, "Kalra,
 Ashish" <Ashish.Kalra@amd.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Janosch Frank <frankja@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-s390@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Andy Lutomirski <luto@kernel.org>, Michael Mueller <mimu@linux.ibm.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gVHVlLCAyNiBOb3YgMjAxOSAxOTo0NToyNyArMDEwMApDaHJpc3RvcGggSGVsbHdpZyA8aGNo
QGxzdC5kZT4gd3JvdGU6Cgo+IE9uIFNhdCwgTm92IDIzLCAyMDE5IGF0IDA5OjM5OjA4QU0gLTA2
MDAsIFRvbSBMZW5kYWNreSB3cm90ZToKPiA+IElkZWFsbHksIGhhdmluZyBhIHBvb2wgb2Ygc2hh
cmVkIHBhZ2VzIGZvciBETUEsIG91dHNpZGUgb2Ygc3RhbmRhcmQKPiA+IFNXSU9UTEIsIG1pZ2h0
IGJlIGEgZ29vZCB0aGluZy4gIE9uIHg4NiwgU1dJT1RMQiByZWFsbHkgc2VlbXMgZ2VhcmVkCj4g
PiB0b3dhcmRzIGRldmljZXMgdGhhdCBkb24ndCBzdXBwb3J0IDY0LWJpdCBETUEuIElmIGEgZGV2
aWNlIHN1cHBvcnRzIDY0LWJpdAo+ID4gRE1BIHRoZW4gaXQgY2FuIHVzZSBzaGFyZWQgcGFnZXMg
dGhhdCByZXNpZGUgYW55d2hlcmUgdG8gcGVyZm9ybSB0aGUgRE1BCj4gPiBhbmQgYm91bmNlIGJ1
ZmZlcmluZy4gSSB3b25kZXIgaWYgdGhlIFNXSU9UTEIgc3VwcG9ydCBjYW4gYmUgZW5oYW5jZWQg
dG8KPiA+IHN1cHBvcnQgc29tZXRoaW5nIGxpa2UgdGhpcywgdXNpbmcgdG9kYXkncyBsb3cgU1dJ
T1RMQiBidWZmZXJzIGlmIHRoZSBETUEKPiA+IG1hc2sgbmVjZXNzaXRhdGVzIGl0LCBvdGhlcndp
c2UgdXNpbmcgYSBkeW5hbWljYWxseSBzaXplZCBwb29sIG9mIHNoYXJlZAo+ID4gcGFnZXMgdGhh
dCBjYW4gbGl2ZSBhbnl3aGVyZS4KPiAKPiBJIHRoaW5rIHRoYXQgY2FuIGJlIGRvbmUgcmVsYXRp
dmVseSBlYXNpbHkuICBJJ3ZlIGFjdHVhbGx5IGJlZW4gdGhpbmtpbmcKPiBvZiBtdWx0aXBsZSBw
b29sIHN1cHBvcnQgZm9yIGEgd2jRlmxlIHRvIHJlcGxhY2UgdGhlIGJvdW5jZSBidWZmZXJpbmcK
PiBpbiB0aGUgYmxvY2sgbGF5ZXIgZm9yIElTQSBkZXZpY2VzICgyNC1iaXQgYWRkcmVzc2luZyku
Cj4gCj4gSSd2ZSBhbHNvIGJlZW4gbG9va2luZyBpbnRvIGEgZG1hX2FsbG9jX3BhZ2VzIGludGVy
ZmFjZSB0byBoZWxwIHBlb3BsZQo+IGp1c3QgYWxsb2NhdGUgcGFnZXMgdGhhdCBhcmUgYWx3YXlz
IGRtYSBhZGRyZXNzYWJsZSwgYnV0IGRvbid0IG5lZWQKPiBhIGNvaGVyZW50IGFsbG9jYXRpb24u
ICBNeSBsYXN0IHZlcnNpb24gSSBzaGFyZWQgaXMgaGVyZToKPiAKPiBodHRwOi8vZ2l0LmluZnJh
ZGVhZC5vcmcvdXNlcnMvaGNoL21pc2MuZ2l0L3Nob3J0bG9nL3JlZnMvaGVhZHMvZG1hX2FsbG9j
X3BhZ2VzCj4gCj4gQnV0IGl0IHR1cm5zIG91dCB0aGlzIHN0aWxsIGRvZXNuJ3Qgd29yayB3aXRo
IFNFViBhcyB3ZSdsbCBhbHdheXMKPiBib3VuY2UuICBBbmQgSSd2ZSBiZWVuIGtpbmRhIGxvc3Qg
b24gZmlndXJpbmcgb3V0IGEgd2F5IGhvdyB0bwo+IGFsbG9jYXRlIHVuZW5jcnlwdGVkIHBhZ2Vz
IHRoYXQgd2Ugd2UgY2FuIGZlZWQgaW50byB0aGUgbm9ybWFsCj4gZG1hX21hcF9wYWdlICYgY28g
aW50ZXJmYWNlcyBkdWUgdG8gdGhlIG1hZ2ljIGVuY3J5cHRpb24gYml0IGluCj4gdGhlIGFkZHJl
c3MuICBJIGd1ZXNzIHdlIGNvdWxkIGhhdmUgYSBmYWxsYmFjayBwYXRoIGluIHRoZSBtYXBwaW5n
Cj4gcGF0aCBhbmQganVzdCB1bmNvbmRpdGlvbmFsbHkgY2xlYXIgdGhhdCBiaXQgaW4gdGhlIGRt
YV90b19waHlzCj4gcGF0aC4KClRoYW5rcyBDaHJpc3RvcGghIFRoYW5rcyBUb20hIEkgd2lsbCBk
byBzb21lIGxvb2tpbmcgYW5kIHRoaW5raW5nIGFuZApyZXBvcnQgYmFjay4KClJlZ2FyZHMsCkhh
bGlsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0
dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vdmlydHVhbGl6YXRpb24=
