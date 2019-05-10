Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CFE2273F
	for <lists.virtualization@lfdr.de>; Sun, 19 May 2019 18:22:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 84776ACD;
	Sun, 19 May 2019 16:17:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C36D99D
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 07:49:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A32761FB
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 07:49:40 +0000 (UTC)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4A7fhmN164359 for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 03:49:39 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2sd2986qjw-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 03:49:39 -0400
Received: from localhost
	by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<imbrenda@linux.ibm.com>; Fri, 10 May 2019 08:49:37 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
	by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Fri, 10 May 2019 08:49:33 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
	[9.149.105.62])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4A7nVKi60162116
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 10 May 2019 07:49:31 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD994AE045;
	Fri, 10 May 2019 07:49:31 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 31475AE05F;
	Fri, 10 May 2019 07:49:31 +0000 (GMT)
Received: from p-imbrenda.boeblingen.de.ibm.com (unknown [9.152.224.155])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 10 May 2019 07:49:31 +0000 (GMT)
Date: Fri, 10 May 2019 09:49:29 +0200
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: "Jason J. Herne" <jjherne@linux.ibm.com>
Subject: Re: [PATCH 04/10] s390/mm: force swiotlb for protected virtualization
In-Reply-To: <4c7a990a-7f11-17f3-2024-18acaf7ceb06@linux.ibm.com>
References: <20190426183245.37939-5-pasic@linux.ibm.com>
	<ad23f5e7-dc78-04af-c892-47bbc65134c6@linux.ibm.com>
	<4c7a990a-7f11-17f3-2024-18acaf7ceb06@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19051007-4275-0000-0000-000003334F05
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051007-4276-0000-0000-00003842C441
Message-Id: <20190510094929.67e4ad29@p-imbrenda.boeblingen.de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905100054
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Sun, 19 May 2019 16:17:22 +0000
Cc: "Vasily Gorbik , " <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
	"Thomas Huth , " <thuth@redhat.com>,
	Farhan Ali <alifm@linux.ibm.com>, kvm@vger.kernel.org,
	Sebastian Ott <sebott@linux.ibm.com>, "Michael S. Tsirkin ,
	" <mst@redhat.com>, "Cornelia Huck , " <cohuck@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Halil Pasic <pasic@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gVGh1LCA5IE1heSAyMDE5IDE0OjA1OjIwIC0wNDAwCiJKYXNvbiBKLiBIZXJuZSIgPGpqaGVy
bmVAbGludXguaWJtLmNvbT4gd3JvdGU6CgpbLi4uXQoKPiA+ICsjZGVmaW5lIHNtZV9tZV9tYXNr
wqDCoMKgIDBVTEwKPiA+ICsKPiA+ICtzdGF0aWMgaW5saW5lIGJvb2wgc21lX2FjdGl2ZSh2b2lk
KSB7IHJldHVybiBmYWxzZTsgfQo+ID4gK2V4dGVybiBib29sIHNldl9hY3RpdmUodm9pZCk7Cj4g
PiArICAKPiAKPiBJIG5vdGljZWQgdGhpcyBwYXRjaCBhbHdheXMgcmV0dXJucyBmYWxzZSBmb3Ig
c21lX2FjdGl2ZS4gSXMgaXQgc2FmZQo+IHRvIGFzc3VtZSB0aGF0IHdoYXRldmVyIGZpeHVwcyBh
cmUgcmVxdWlyZWQgb24geDg2IHRvIGRlYWwgd2l0aCBzbWUKPiBkbyBub3QgYXBwbHkgdG8gczM5
MD8KCnllcywgb24geDg2IHNldl9hY3RpdmUgcmV0dXJucyBmYWxzZSBpZiBTRVYgaXMgZW5hYmxl
ZC4gU01FIGlzIGZvcgpob3N0IG1lbW9yeSBlbmNyeXB0aW9uLiBmcm9tIGFyY2gveDg2L21tL21l
bV9lbmNyeXB0LmM6Cgpib29sIHNtZV9hY3RpdmUodm9pZCkKewogICAgICAgIHJldHVybiBzbWVf
bWVfbWFzayAmJiAhc2V2X2VuYWJsZWQ7Cn0KCmFuZCBpdCBtYWtlcyBzZW5zZSBiZWNhdXNlIHlv
dSBjYW4ndCBoYXZlIGJvdGggU01FIGFuZCBTRVYgZW5hYmxlZCBvbgp0aGUgc2FtZSBrZXJuZWws
IGJlY2F1c2UgZWl0aGVyIHlvdSdyZSBydW5uaW5nIG9uIGJhcmUgbWV0YWwgKGFuZCB0aGVuCnlv
dSBjYW4gaGF2ZSBTTUUpIF9fb3JfXyB5b3UgYXJlIHJ1bm5pbmcgYXMgYSBndWVzdCAoYW5kIHRo
ZW4geW91IGNhbgpoYXZlIFNFVikuIFRoZSBrZXkgZGlmZmVyZW5jZSBpcyB0aGF0IERNQSBvcGVy
YXRpb25zIGRvbid0IG5lZWQKYm91bmNlIGJ1ZmZlcnMgd2l0aCBTTUUsIGJ1dCB0aGV5IGRvIHdp
dGggU0VWLgoKSSBob3BlIHRoaXMgY2xhcmlmaWVzIHlvdXIgZG91YnRzIDopCgpbLi4uXQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
