Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C5B1324FD
	for <lists.virtualization@lfdr.de>; Tue,  7 Jan 2020 12:35:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0DFD620119;
	Tue,  7 Jan 2020 11:35:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9bad-ryt8dzx; Tue,  7 Jan 2020 11:35:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B48DE2014A;
	Tue,  7 Jan 2020 11:35:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9958CC0881;
	Tue,  7 Jan 2020 11:35:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 844E1C0881
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 11:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6CAB584FDD
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 11:34:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dgbfNNlziB5k
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 11:34:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0ED51835F2
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 11:34:57 +0000 (UTC)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 007BXvSH045052
 for <virtualization@lists.linux-foundation.org>; Tue, 7 Jan 2020 06:34:57 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xb8wgfv6d-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <virtualization@lists.linux-foundation.org>;
 Tue, 07 Jan 2020 06:34:56 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <virtualization@lists.linux-foundation.org> from <borntraeger@de.ibm.com>; 
 Tue, 7 Jan 2020 11:34:54 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 7 Jan 2020 11:34:51 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 007BYohE47513776
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Jan 2020 11:34:50 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A1CB4C046;
 Tue,  7 Jan 2020 11:34:50 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 492354C04A;
 Tue,  7 Jan 2020 11:34:50 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.152.224.119])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Jan 2020 11:34:50 +0000 (GMT)
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger random
 crashes in KVM guests after reboot
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <c022e1d6-0d57-ae07-5e6b-8e40d3b01f4b@de.ibm.com>
 <20191218100926-mutt-send-email-mst@kernel.org>
 <2ffdbd95-e375-a627-55a1-6990b0a0e37a@de.ibm.com>
 <20200106054041-mutt-send-email-mst@kernel.org>
 <08ae8d28-3d8c-04e8-bdeb-0117d06c6dc7@de.ibm.com>
 <20200107042401-mutt-send-email-mst@kernel.org>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
 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
 nS4h0HDFPrrp1C2EMVYIQrMokWvlFZbCpsdYbBI=
Date: Tue, 7 Jan 2020 12:34:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20200107042401-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20010711-0028-0000-0000-000003CEE3B4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20010711-0029-0000-0000-00002492F331
Message-Id: <c6795e53-d12c-0709-c2e9-e35d9af1f693@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-07_03:2020-01-06,2020-01-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-2001070095
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kvm list <kvm@vger.kernel.org>,
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

CgpPbiAwNy4wMS4yMCAxMDozOSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+IE9uIFR1ZSwg
SmFuIDA3LCAyMDIwIGF0IDA5OjU5OjE2QU0gKzAxMDAsIENocmlzdGlhbiBCb3JudHJhZWdlciB3
cm90ZToKPj4KPj4KPj4gT24gMDYuMDEuMjAgMTE6NTAsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90
ZToKPj4+IE9uIFdlZCwgRGVjIDE4LCAyMDE5IGF0IDA0OjU5OjAyUE0gKzAxMDAsIENocmlzdGlh
biBCb3JudHJhZWdlciB3cm90ZToKPj4+PiBPbiAxOC4xMi4xOSAxNjoxMCwgTWljaGFlbCBTLiBU
c2lya2luIHdyb3RlOgo+Pj4+PiBPbiBXZWQsIERlYyAxOCwgMjAxOSBhdCAwMzo0Mzo0M1BNICsw
MTAwLCBDaHJpc3RpYW4gQm9ybnRyYWVnZXIgd3JvdGU6Cj4+Pj4+PiBNaWNoYWVsLAo+Pj4+Pj4K
Pj4+Pj4+IHdpdGggCj4+Pj4+PiBjb21taXQgZGI3Mjg2YjEwMGI1MDNlZjgwNjEyODg0NDUzYmVk
NTNkNzRjOWExNiAocmVmcy9iaXNlY3Qvc2tpcC1kYjcyODZiMTAwYjUwM2VmODA2MTI4ODQ0NTNi
ZWQ1M2Q3NGM5YTE2KQo+Pj4+Pj4gICAgIHZob3N0OiB1c2UgYmF0Y2hlZCB2ZXJzaW9uIGJ5IGRl
ZmF1bHQKPj4+Pj4+IHBsdXMKPj4+Pj4+IGNvbW1pdCA2YmQyNjJkNWVhZmNkZjhjZGZhZTQ5MWUy
ZTc0OGU0ZTQzNGRjZGE2IChIRUFELCByZWZzL2Jpc2VjdC9iYWQpCj4+Pj4+PiAgICAgUmV2ZXJ0
ICJ2aG9zdC9uZXQ6IGFkZCBhbiBvcHRpb24gdG8gdGVzdCBuZXcgY29kZSIKPj4+Pj4+IHRvIG1h
a2UgdGhpbmdzIGNvbXBpbGUgKHlvdXIgbmV4dCB0cmVlIGlzIG5vdCBlYXNpbHkgYmlzZWN0YWJs
ZSwgY2FuIHlvdSBmaXggdGhhdCBhcyB3ZWxsPykuCj4+Pj4+Cj4+Pj4+IEknbGwgdHJ5Lgo+Pj4+
Pgo+Pj4+Pj4KPj4+Pj4+IEkgZ2V0IHJhbmRvbSBjcmFzaGVzIGluIG15IHMzOTAgS1ZNIGd1ZXN0
cyBhZnRlciByZWJvb3QuCj4+Pj4+PiBSZXZlcnRpbmcgYm90aCBwYXRjaGVzIHRvZ2V0aGVyIHdp
dGggY29tbWl0IGRlY2Q5YjggInZob3N0OiB1c2Ugdmhvc3RfZGVzYyBpbnN0ZWFkIG9mIHZob3N0
X2xvZyIgdG8KPj4+Pj4+IG1ha2UgaXQgY29tcGlsZSBhZ2Fpbikgb24gdG9wIG9mIGxpbnV4LW5l
eHQtMTIxOCBtYWtlcyB0aGUgcHJvYmxlbSBnbyBhd2F5Lgo+Pj4+Pj4KPj4+Pj4+IExvb2tzIGxp
a2UgdGhlIGJhdGNoZWQgdmVyc2lvbiBpcyBub3QgeWV0IHJlYWR5IGZvciBwcmltZSB0aW1lLiBD
YW4geW91IGRyb3AgdGhlc2UgcGF0Y2hlcyB1bnRpbAo+Pj4+Pj4gd2UgaGF2ZSBmaXhlZCB0aGUg
aXNzdWVzPwo+Pj4+Pj4KPj4+Pj4+IENocmlzdGlhbgo+Pj4+Pj4KPj4+Pj4KPj4+Pj4gV2lsbCBk
bywgdGhhbmtzIGZvciBsZXR0aW5nIG1lIGtub3cuCj4+Pj4KPj4+PiBJIGhhdmUgY29uZmlybWVk
IHdpdGggdGhlIGluaXRpYWwgcmVwb3J0ZXIgKGludGVybmFsIHRlc3QgdGVhbSkgdGhhdCA8ZHJp
dmVyIG5hbWU9J3FlbXUnLz4gCj4+Pj4gd2l0aCBhIGtub3duIHRvIGJlIGJyb2tlbiBsaW51eCBu
ZXh0IGtlcm5lbCBhbHNvIGZpeGVzIHRoZSBwcm9ibGVtLCBzbyBpdCBpcyByZWFsbHkgdGhlCj4+
Pj4gdmhvc3QgY2hhbmdlcy4KPj4+Cj4+PiBPSyBJJ20gYmFjayBhbmQgdHJ5aW5nIHRvIG1ha2Ug
aXQgbW9yZSBiaXNlY3RhYmxlLgo+Pj4KPj4+IEkgcHVzaGVkIGEgbmV3IHRhZyAiYmF0Y2gtdjIi
Lgo+Pj4gSXQncyBzYW1lIGNvZGUgYnV0IHdpdGggdGhpcyBiaXNlY3Qgc2hvdWxkIGdldCBtb3Jl
IGluZm9ybWF0aW9uLgo+Pgo+PiBJIGdldCB0aGUgZm9sbG93aW5nIHdpdGggdGhpcyB0YWcKPj4K
Pj4gZHJpdmVycy92aG9zdC9uZXQuYzogSW4gZnVuY3Rpb24g4oCYdmhvc3RfbmV0X3R4X2dldF92
cV9kZXNj4oCZOgo+PiBkcml2ZXJzL3Zob3N0L25ldC5jOjU3NDo3OiBlcnJvcjogaW1wbGljaXQg
ZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYdmhvc3RfZ2V0X3ZxX2Rlc2NfYmF0Y2jigJk7IGRp
ZCB5b3UgbWVhbiDigJh2aG9zdF9nZXRfdnFfZGVzY+KAmT8gWy1XZXJyb3I9aW1wbGljaXQtZnVu
Y3Rpb24tZGVjbGFyYXRpb25dCj4+ICAgNTc0IHwgICByID0gdmhvc3RfZ2V0X3ZxX2Rlc2NfYmF0
Y2godHZxLCB0dnEtPmlvdiwgQVJSQVlfU0laRSh0dnEtPmlvdiksCj4+ICAgICAgIHwgICAgICAg
Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPj4gICAgICAgfCAgICAgICB2aG9zdF9nZXRfdnFfZGVz
Ywo+Pgo+IAo+IE5vdCBzdXJlIHdoeSBidXQgSSBwdXNoZWQgYSB3cm9uZyBjb21taXQuIFNvcnJ5
LiBTaG91bGQgYmUgZ29vZCBub3cuCj4gCgpkdXJpbmcgYmlzZWN0OgoKZHJpdmVycy92aG9zdC92
aG9zdC5jOiBJbiBmdW5jdGlvbiDigJh2aG9zdF9nZXRfdnFfZGVzY19iYXRjaOKAmToKZHJpdmVy
cy92aG9zdC92aG9zdC5jOjI2MzQ6ODogZXJyb3I6IOKAmGlk4oCZIHVuZGVjbGFyZWQgKGZpcnN0
IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmGnigJk/CiAyNjM0IHwgIHJl
dCA9IGlkOwogICAgICB8ICAgICAgICBefgogICAgICB8ICAgICAgICBpCgpJIGNoYW5nZWQgdGhh
dCB0byBpCgoKVGhlIGxhc3Qgc3RlcCB0aGVuIGdhdmUgbWUgIChvbiBjb21taXQgNTAyOTdhODQ4
MGI0MzllZmM1ZjNmMjMwODhjYjJkOTBiNzk5YWNlZiB2aG9zdDogdXNlIGJhdGNoZWQgdmVyc2lv
biBieSBkZWZhdWx0KQpuZXQgZW5jMTogVW5leHBlY3RlZCBUWFEgKDApIHF1ZXVlIGZhaWx1cmU6
IC01CmluIHRoZSBndWVzdC4KCmJpc2VjdCBsb2cgc28gZmFyOgpbY2Jvcm50cmFAbTgzbHA1MiBs
aW51eF0kIGdpdCBiaXNlY3QgbG9nCmdpdCBiaXNlY3Qgc3RhcnQKIyBiYWQ6IFszMTMxZTc5YmI5
ZTk4OTJhNWE2YmQzMzUxM2RlOWJjOTBiMjBlODY3XSB2aG9zdDogdXNlIHZob3N0X2Rlc2MgaW5z
dGVhZCBvZiB2aG9zdF9sb2cKZ2l0IGJpc2VjdCBiYWQgMzEzMWU3OWJiOWU5ODkyYTVhNmJkMzM1
MTNkZTliYzkwYjIwZTg2NwojIGdvb2Q6IFtkMTI4MWUzYTU2MmVjNmEwOGY5NDRhODc2NDgxZGQw
NDNiYTczOWI5XSB2aXJ0aW8tYmxrOiByZW1vdmUgVklSVElPX0JMS19GX1NDU0kgc3VwcG9ydApn
aXQgYmlzZWN0IGdvb2QgZDEyODFlM2E1NjJlYzZhMDhmOTQ0YTg3NjQ4MWRkMDQzYmE3MzliOQoj
IGdvb2Q6IFs1YjAwYWFiNWI2MzMyYTY3ZTMyZGFjZTFkY2QzYTE5OGFiOTRlZDU2XSB2aG9zdDog
b3B0aW9uIHRvIGZldGNoIGRlc2NyaXB0b3JzIHRocm91Z2ggYW4gaW5kZXBlbmRlbnQgc3RydWN0
CmdpdCBiaXNlY3QgZ29vZCA1YjAwYWFiNWI2MzMyYTY3ZTMyZGFjZTFkY2QzYTE5OGFiOTRlZDU2
CiMgZ29vZDogWzViMDBhYWI1YjYzMzJhNjdlMzJkYWNlMWRjZDNhMTk4YWI5NGVkNTZdIHZob3N0
OiBvcHRpb24gdG8gZmV0Y2ggZGVzY3JpcHRvcnMgdGhyb3VnaCBhbiBpbmRlcGVuZGVudCBzdHJ1
Y3QKZ2l0IGJpc2VjdCBnb29kIDViMDBhYWI1YjYzMzJhNjdlMzJkYWNlMWRjZDNhMTk4YWI5NGVk
NTYKIyBiYWQ6IFsxNDE0ZDdlZTNkMTBkMmVjMmJjNGVlNjUyZDFkOTBlYzkxZGExYzc5XSB2aG9z
dDogYmF0Y2hpbmcgZmV0Y2hlcwpnaXQgYmlzZWN0IGJhZCAxNDE0ZDdlZTNkMTBkMmVjMmJjNGVl
NjUyZDFkOTBlYzkxZGExYzc5CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25A
bGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
