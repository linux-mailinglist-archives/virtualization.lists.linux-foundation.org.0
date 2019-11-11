Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B84BF6FBB
	for <lists.virtualization@lfdr.de>; Mon, 11 Nov 2019 09:32:04 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 883D9C6E;
	Mon, 11 Nov 2019 08:31:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B5212C11
	for <virtualization@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 08:31:55 +0000 (UTC)
X-Greylist: delayed 00:21:13 by SQLgrey-1.7.6
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 532168AA
	for <virtualization@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 08:31:55 +0000 (UTC)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	xAB88xbO116011 for <virtualization@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 03:10:41 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2w5s5569ba-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 03:10:40 -0500
Received: from localhost
	by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<borntraeger@de.ibm.com>; Mon, 11 Nov 2019 08:10:07 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
	by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Mon, 11 Nov 2019 08:10:02 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
	[9.149.105.60])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id xAB8A1bI42205296
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 11 Nov 2019 08:10:01 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 184CC42049;
	Mon, 11 Nov 2019 08:10:01 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 807704203F;
	Mon, 11 Nov 2019 08:10:00 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.152.224.123])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 11 Nov 2019 08:10:00 +0000 (GMT)
Subject: Re: [PATCH 01/13] compiler.h: Split {READ, WRITE}_ONCE definitions out
	into rwonce.h
To: Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>
References: <20191108170120.22331-1-will@kernel.org>
	<20191108170120.22331-2-will@kernel.org>
	<CAK8P3a0f=WvSQSBQ4t0FmEkcFE_mC3oARxaeTviTSkSa-D2qhg@mail.gmail.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
	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
	nS4h0HDFPrrp1C2EMVYIQrMokWvlFZbCpsdYbBI=
Date: Mon, 11 Nov 2019 09:10:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0f=WvSQSBQ4t0FmEkcFE_mC3oARxaeTviTSkSa-D2qhg@mail.gmail.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19111108-0016-0000-0000-000002C2960C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111108-0017-0000-0000-00003324241A
Message-Id: <93f80017-d65e-7c3a-29b0-d9a568d08f58@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-11-11_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1910280000 definitions=main-1911110079
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Josh Triplett <josh@joshtriplett.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	SeongJae Park <sj38.park@gmail.com>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	alpha <linux-alpha@vger.kernel.org>, Joe Perches <joe@perches.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Matt Turner <mattst88@gmail.com>, Yunjae Lee <lyj7694@gmail.com>,
	virtualization@lists.linux-foundation.org,
	Boqun Feng <boqun.feng@gmail.com>, Richard Henderson <rth@twiddle.net>
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

CgpPbiAwOC4xMS4xOSAyMDo1NywgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBPbiBGcmksIE5vdiA4
LCAyMDE5IGF0IDY6MDEgUE0gV2lsbCBEZWFjb24gPHdpbGxAa2VybmVsLm9yZz4gd3JvdGU6Cj4+
Cj4+IEluIHByZXBhcmF0aW9uIGZvciBhbGxvd2luZyBhcmNoaXRlY3R1cmVzIHRvIGRlZmluZSB0
aGVpciBvd24KPj4gaW1wbGVtZW50YXRpb24gb2YgdGhlICdSRUFEX09OQ0UoKScgbWFjcm8sIG1v
dmUgdGhlIGdlbmVyaWMKPj4gJ3tSRUFELFdSSVRFfV9PTkNFKCknIGRlZmluaXRpb25zIG91dCBv
ZiB0aGUgdW53aWVsZHkgJ2xpbnV4L2NvbXBpbGVyLmgnCj4+IGFuZCBpbnRvIGEgbmV3ICdyd29u
Y2UuaCcgaGVhZGVyIHVuZGVyICdhc20tZ2VuZXJpYycuCj4gCj4gQWRkaW5nIENocmlzdGlhbiBC
b3JudHLDpGdlciB0byBDYywgaGUgb3JpZ2luYWxseSBhZGRlZCB0aGUKPiBSRUFEX09OQ0UoKS9X
UklURV9PTkNFKCkKPiBjb2RlLgo+IAo+IEkgd29uZGVyIGlmIGl0IHdvdWxkIGJlIGFwcHJvcHJp
YXRlIG5vdyB0byByZXZlcnQgYmFjayB0byBhIG11Y2ggc2ltcGxlciB2ZXJzaW9uCj4gb2YgdGhl
c2UgaGVscGVycyBmb3IgYW55IG1vZGVybiBjb21waWxlci4gQXMgSSB1bmRlcnN0YW5kLCBvbmx5
IGdjYy00LjYgYW5kCj4gZ2NjNC43IGFjdHVhbGx5IG5lZWQgdGhlIHNvbmctYW5kLWRhbmNlIHZl
cnNpb24gd2l0aCB0aGUgdW5pb24gYW5kIHN3aXRjaC9jYXNlLAo+IHdoaWxlIGZvciBvdGhlcnMs
IHdlIGNhbiBtaWdodCBiZSBhYmxlIGJhY2sgdG8gYSBtYWNybyBkb2luZyBhIHZvbGF0aWxlIGFj
Y2Vzcy4KCkFzIGZhciBhcyBJIGtub3cgdGhpcyBwYXJ0aWN1bGFyIGlzc3VlIHdpdGggIHZvbGF0
aWxlIGFjY2VzcyBvbiBhZ2dyZWdhdGUgdHlwZXMKd2FzIGZpeGVkIGluIGdjYyA0LjguIE9uIHRo
ZSBvdGhlciBoYW5kIHdlIGtub3cgdGhhdCB0aGUgY3VycmVudCBjb25zdHJ1Y3Qgd2lsbAp3b3Jr
IG9uIGFsbCBjb21waWxlcnMuIE5vdCBzbyBzdXJlIGFib3V0IHRoZSBvcmlnbmFsIEFDQ0VTU19P
TkNFIGltcGxlbWVudGF0aW9uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
