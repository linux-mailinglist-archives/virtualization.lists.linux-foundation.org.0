Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AEE158F9E
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 14:13:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A043F204D7;
	Tue, 11 Feb 2020 13:13:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i4-kT6IJsgFU; Tue, 11 Feb 2020 13:13:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 21CC5204DE;
	Tue, 11 Feb 2020 13:13:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00438C07FE;
	Tue, 11 Feb 2020 13:13:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C466C07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 13:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 825F2204D7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 13:13:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QSQki7hUfWXB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 13:13:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by silver.osuosl.org (Postfix) with ESMTPS id 8FDAA204C5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 13:13:46 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01BD0G92008259 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 08:13:45 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y3pqfdbgc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 08:13:45 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <virtualization@lists.linux-foundation.org> from <borntraeger@de.ibm.com>; 
 Tue, 11 Feb 2020 13:13:43 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 11 Feb 2020 13:13:40 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01BDDdAH47906956
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Feb 2020 13:13:39 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1591E52059;
 Tue, 11 Feb 2020 13:13:39 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.152.98.183])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id BA0D75204E;
 Tue, 11 Feb 2020 13:13:38 +0000 (GMT)
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger random
 crashes in KVM guests after reboot
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>
References: <20200107042401-mutt-send-email-mst@kernel.org>
 <c6795e53-d12c-0709-c2e9-e35d9af1f693@de.ibm.com>
 <20200107065434-mutt-send-email-mst@kernel.org>
 <fe6e7e90-3004-eb7a-9ed8-b53a7667959f@de.ibm.com>
 <20200120012724-mutt-send-email-mst@kernel.org>
 <2a63b15f-8cf5-5868-550c-42e2cfd92c60@de.ibm.com>
 <b6e32f58e5d85ac5cc3141e9155fb140ae5cd580.camel@redhat.com>
 <1ade56b5-083f-bb6f-d3e0-3ddcf78f4d26@de.ibm.com>
 <20200206171349-mutt-send-email-mst@kernel.org>
 <5c860fa1-cef5-b389-4ebf-99a62afa0fe8@de.ibm.com>
 <20200207025806-mutt-send-email-mst@kernel.org>
 <97c93d38-ef07-e321-d133-18483d54c0c0@de.ibm.com>
 <CAJaqyWfngzP4d01B6+Sqt8FXN6jX7kGegjx8ie4no_1Er3igQA@mail.gmail.com>
 <43a5dbaa-9129-e220-8483-45c60a82c945@de.ibm.com>
 <e299afca8e22044916abbf9fbbd0bff6b0ee9e13.camel@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
 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
 nS4h0HDFPrrp1C2EMVYIQrMokWvlFZbCpsdYbBI=
Date: Tue, 11 Feb 2020 14:13:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <e299afca8e22044916abbf9fbbd0bff6b0ee9e13.camel@redhat.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20021113-0016-0000-0000-000002E5D512
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021113-0017-0000-0000-00003348CB1F
Message-Id: <4c3f70b7-723a-8b0f-ac49-babef1bcc180@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-11_03:2020-02-10,
 2020-02-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=2 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002110100
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kvm list <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Halil Pasic <pasic@linux.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
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

CgpPbiAxMS4wMi4yMCAxNDowNCwgRXVnZW5pbyBQw6lyZXogd3JvdGU6Cj4gT24gTW9uLCAyMDIw
LTAyLTEwIGF0IDEyOjAxICswMTAwLCBDaHJpc3RpYW4gQm9ybnRyYWVnZXIgd3JvdGU6Cj4+Cj4+
IE9uIDEwLjAyLjIwIDEwOjQ3LCBFdWdlbmlvIFBlcmV6IE1hcnRpbiB3cm90ZToKPj4+IEhpIENo
cmlzdGlhbi4KPj4+Cj4+PiBJJ20gbm90IGFibGUgdG8gcmVwcm9kdWNlIHRoZSBmYWlsdXJlIHdp
dGggZWNjYjg1MmYxZmU2YmVkZTYzMGUyZTRmMWExMjFhODFlMzQzNTRhYiBjb21taXQuIENvdWxk
IHlvdSBhZGQgbW9yZSBkYXRhPwo+Pj4gWW91ciBjb25maWd1cmF0aW9uIChsaWJ2aXJ0IG9yIHFl
bXUgbGluZSksIGFuZCBob3N0J3MgZG1lc2cgb3V0cHV0IGlmIGFueT8KPj4+Cj4+PiBUaGFua3Mh
Cj4+Cj4+IElmIGl0IHdhcyBub3Qgb2J2aW91cywgdGhpcyBpcyBvbiBzMzkweCwgYSBiaWcgZW5k
aWFuIHN5c3RlbS4KPj4KPiAKPiBIaSBDaHJpc3RpYW4uIFRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9y
IHlvdXIgZmFzdCByZXNwb25zZXMuCj4gCj4gQ291bGQgeW91IHRyeSB0aGlzIHBhdGNoIG9uIHRv
cCBvZiBlY2NiODUyZjFmZTZiZWRlNjMwZTJlNGYxYTEyMWE4MWUzNDM1NGFiPwoKSSBzdGlsbCBn
ZXQgClsgICA0My42NjUxNDVdIEd1ZXN0IG1vdmVkIHVzZWQgaW5kZXggZnJvbSAwIHRvIDI4OQph
ZnRlciBzb21lIHJlYm9vdHMuCgoKPiAKPiBUaGFua3MhCj4gCj4gRnJvbSA3MWQwZjkxMDhhMThh
YTg5NGNjMGMwYzFjN2VmYmFkMzlmNDY1YTI3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+IEZy
b206ID0/VVRGLTg/cT9FdWdlbmlvPTIwUD1DMz1BOXJlej89IDwKPiBlcGVyZXptYUByZWRoYXQu
Y29tPgo+IERhdGU6IFR1ZSwgMTEgRmViIDIwMjAgMTM6MTk6MTAgKzAxMDAKPiBTdWJqZWN0OiBb
UEFUQ0hdIHZob3N0OiBmaXggcmV0dXJuIHZhbHVlIG9mIHZob3N0X2dldF92cV9kZXNjCj4gCj4g
QmVmb3JlIG9mIHRoZSBiYXRjaCBjaGFuZ2UsIGl0IHdhcyB0aGUgY2hhaW4ncyBoZWFkLiBOZWVk
IHRvIGtlZXAgdGhhdAo+IHdheSBvciB3ZSB3aWxsIG5vdCBiZSBhYmxlIHRvIGZyZWUgYSBjaGFp
biBvZiBkZXNjcmlwdG9ycy4KPiAKPiBGaXhlczogZWNjYjg1MmYxZmU2ICgidmhvc3Q6IGJhdGNo
aW5nIGZldGNoZXMiKQo+IC0tLQo+ICBkcml2ZXJzL3Zob3N0L3Zob3N0LmMgfCAzICstLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYwo+IGlu
ZGV4IGI1YTUxYjFmMmU3OS4uZmM0MjJjM2U1YzA4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmhv
c3Qvdmhvc3QuYwo+ICsrKyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYwo+IEBAIC0yNDA5LDEyICsy
NDA5LDExIEBAIGludCB2aG9zdF9nZXRfdnFfZGVzYyhzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2
cSwKPiAgCQkJKm91dF9udW0gKz0gcmV0Owo+ICAJCX0KPiAgCj4gLQkJcmV0ID0gZGVzYy0+aWQ7
Cj4gLQo+ICAJCWlmICghKGRlc2MtPmZsYWdzICYgVlJJTkdfREVTQ19GX05FWFQpKQo+ICAJCQli
cmVhazsKPiAgCX0KPiAgCj4gKwlyZXQgPSB2cS0+ZGVzY3NbdnEtPmZpcnN0X2Rlc2NdLmlkOwo+
ICAJdnEtPmZpcnN0X2Rlc2MgPSBpICsgMTsKPiAgCj4gIAlyZXR1cm4gcmV0Owo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24g
bWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxp
emF0aW9u
