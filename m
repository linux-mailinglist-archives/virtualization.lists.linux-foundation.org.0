Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E440B1680EB
	for <lists.virtualization@lfdr.de>; Fri, 21 Feb 2020 15:56:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6F81B86433;
	Fri, 21 Feb 2020 14:56:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bxIuxeZOC8dU; Fri, 21 Feb 2020 14:56:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BA810844CA;
	Fri, 21 Feb 2020 14:56:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A02A9C013E;
	Fri, 21 Feb 2020 14:56:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59EA0C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 14:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 561E8844CA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 14:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vnWUFwG956aO
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 14:56:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 92F87844A7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 14:56:13 +0000 (UTC)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01LEt99p173439 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 09:56:12 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y8uby56bc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 09:56:12 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <virtualization@lists.linux-foundation.org> from <pasic@linux.ibm.com>;
 Fri, 21 Feb 2020 14:56:10 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 21 Feb 2020 14:56:05 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01LEu3jL46924190
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Feb 2020 14:56:03 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C874B4C046;
 Fri, 21 Feb 2020 14:56:03 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 424374C04E;
 Fri, 21 Feb 2020 14:56:03 +0000 (GMT)
Received: from oc2783563651 (unknown [9.152.224.149])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 Feb 2020 14:56:03 +0000 (GMT)
Date: Fri, 21 Feb 2020 15:56:02 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 0/2] virtio: decouple protected guest RAM form
 VIRTIO_F_IOMMU_PLATFORM
In-Reply-To: <426e6972-0565-c931-e171-da0f58fbf856@redhat.com>
References: <20200220160606.53156-1-pasic@linux.ibm.com>
 <426e6972-0565-c931-e171-da0f58fbf856@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 20022114-0020-0000-0000-000003AC5719
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022114-0021-0000-0000-000022046169
Message-Id: <20200221155602.4de41fa7.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-21_04:2020-02-21,
 2020-02-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002210115
Cc: linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, David Gibson <david@gibson.dropbear.id.au>,
 Michael Mueller <mimu@linux.ibm.com>, "Lendacky,
 Thomas" <Thomas.Lendacky@amd.com>, Viktor Mihajlovski <mihajlov@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
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

T24gRnJpLCAyMSBGZWIgMjAyMCAxNDoyMjoyNiArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKCj4gCj4gT24gMjAyMC8yLzIxIOS4iuWNiDEyOjA2LCBIYWxpbCBQ
YXNpYyB3cm90ZToKPiA+IEN1cnJlbnRseSBpZiBvbmUgaW50ZW5kcyB0byBydW4gYSBtZW1vcnkg
cHJvdGVjdGlvbiBlbmFibGVkIFZNIHdpdGgKPiA+IHZpcnRpbyBkZXZpY2VzIGFuZCBsaW51eCBh
cyB0aGUgZ3Vlc3QgT1MsIG9uZSBuZWVkcyB0byBzcGVjaWZ5IHRoZQo+ID4gVklSVElPX0ZfSU9N
TVVfUExBVEZPUk0gZmxhZyBmb3IgZWFjaCB2aXJ0aW8gZGV2aWNlIHRvIG1ha2UgdGhlIGd1ZXN0
Cj4gPiBsaW51eCB1c2UgdGhlIERNQSBBUEksIHdoaWNoIGluIHR1cm4gaGFuZGxlcyB0aGUgbWVt
b3J5Cj4gPiBlbmNyeXB0aW9uL3Byb3RlY3Rpb24gc3R1ZmYgaWYgdGhlIGd1ZXN0IGRlY2lkZXMg
dG8gdHVybiBpdHNlbGYgaW50bwo+ID4gYSBwcm90ZWN0ZWQgb25lLiBUaGlzIGhvd2V2ZXIgbWFr
ZXMgbm8gc2Vuc2UgZHVlIHRvIG11bHRpcGxlIHJlYXNvbnM6Cj4gPiAqIFRoZSBkZXZpY2UgaXMg
bm90IGNoYW5nZWQgYnkgdGhlIGZhY3QgdGhhdCB0aGUgZ3Vlc3QgUkFNIGlzCj4gPiBwcm90ZWN0
ZWQuIFRoZSBzbyBjYWxsZWQgSU9NTVUgYnlwYXNzIHF1aXJrIGlzIG5vdCBhZmZlY3RlZC4KPiA+
ICogVGhpcyB1c2FnZSBpcyBub3QgY29uZ3J1ZW50IHdpdGggIHN0YW5kYXJkaXNlZCBzZW1hbnRp
Y3Mgb2YKPiA+IFZJUlRJT19GX0lPTU1VX1BMQVRGT1JNLiBHdWVzdCBtZW1vcnkgcHJvdGVjdGVk
IGlzIGFuIG9ydGhvZ29uYWwgcmVhc29uCj4gPiBmb3IgdXNpbmcgRE1BIEFQSSBpbiB2aXJ0aW8g
KG9ydGhvZ29uYWwgd2l0aCByZXNwZWN0IHRvIHdoYXQgaXMKPiA+IGV4cHJlc3NlZCBieSBWSVJU
SU9fRl9JT01NVV9QTEFURk9STSkuCj4gPgo+ID4gVGhpcyBzZXJpZXMgYWltcyB0byBkZWNvdXBs
ZSAnaGF2ZSB0byB1c2UgRE1BIEFQSSBiZWNhdXNlIG15IChndWVzdCkgUkFNCj4gPiBpcyBwcm90
ZWN0ZWQnIGFuZCAnaGF2ZSB0byB1c2UgRE1BIEFQSSBiZWNhdXNlIHRoZSBkZXZpY2UgdG9sZCBt
ZQo+ID4gVklSVElPX0ZfSU9NTVVfUExBVEZPUk0nLgo+ID4KPiA+IFBsZWFzZSBmaW5kIG1vcmUg
ZGV0YWlsZWQgZXhwbGFuYXRpb25zIGFib3V0IHRoZSBjb25jZXB0dWFsIGFzcGVjdHMgaW4KPiA+
IHRoZSBpbmRpdmlkdWFsIHBhdGNoZXMuIFRoZXJlIGlzIGhvd2V2ZXIgYWxzbyBhIHZlcnkgcHJh
Y3RpY2FsIHByb2JsZW0KPiA+IHRoYXQgaXMgYWRkcmVzc2VkIGJ5IHRoaXMgc2VyaWVzLgo+ID4K
PiA+IEZvciB2aG9zdC1uZXQgdGhlIGZlYXR1cmUgVklSVElPX0ZfSU9NTVVfUExBVEZPUk0gaGFz
IHRoZSBmb2xsb3dpbmcgc2lkZQo+ID4gZWZmZWN0IFRoZSB2aG9zdCBjb2RlIGFzc3VtZXMgaXQg
dGhlIGFkZHJlc3NlcyBvbiB0aGUgdmlydGlvIGRlc2NyaXB0b3IKPiA+IHJpbmcgYXJlIG5vdCBn
dWVzdCBwaHlzaWNhbCBhZGRyZXNzZXMgYnV0IGlvdmEncywgYW5kIGluc2lzdHMgb24gZG9pbmcg
YQo+ID4gdHJhbnNsYXRpb24gb2YgdGhlc2UgcmVnYXJkbGVzcyBvZiB3aGF0IHRyYW5zcG9ydCBp
cyB1c2VkIChlLmcuIHdoZXRoZXIKPiA+IHdlIGVtdWxhdGUgYSBQQ0kgb3IgYSBDQ1cgZGV2aWNl
KS4gKEZvciBkZXRhaWxzIHNlZSBjb21taXQgNmIxZTZjYzc4NTViCj4gPiAidmhvc3Q6IG5ldyBk
ZXZpY2UgSU9UTEIgQVBJIi4pIE9uIHMzOTAgdGhpcyByZXN1bHRzIGluIHNldmVyZQo+ID4gcGVy
Zm9ybWFuY2UgZGVncmFkYXRpb24gKGMuYS4gZmFjdG9yIDEwKS4KPiAKPiAKPiBEbyB5b3Ugc2Vl
IGEgY29uc2lzdGVudCBkZWdyYWRhdGlvbiBvbiB0aGUgcGVyZm9ybWFuY2UsIG9yIGl0IG9ubHkg
Cj4gaGFwcGVuIHdoZW4gZm9yIGR1cmluZyB0aGUgYmVnaW5uaW5nIG9mIHRoZSB0ZXN0Pwo+IAoK
QUZBSUsgdGhlIGRlZ3JhZGF0aW9uIGlzIGNvbnNpc3RlbnQuCgo+IAo+ID4gQlRXIHdpdGggY2N3
IEkvTyB0aGVyZSBpcwo+ID4gKGFyY2hpdGVjdHVyYWxseSkgbm8gSU9NTVUsIHNvIHRoZSB3aG9s
ZSBhZGRyZXNzIHRyYW5zbGF0aW9uIG1ha2VzIG5vCj4gPiBzZW5zZSBpbiB0aGUgY29udGV4dCBv
ZiB2aXJ0aW8tY2N3Lgo+IAo+IAo+IEkgc3VzcGVjdCB3ZSBjYW4gZG8gb3B0aW1pemF0aW9uIGlu
IHFlbXUgc2lkZS4KPiAKPiBFLmcgc2VuZCBtZW10YWJsZSBlbnRyeSB2aWEgSU9UTEIgQVBJIHdo
ZW4gdklPTU1VIGlzIG5vdCBlbmFibGVkLgo+IAo+IElmIHRoaXMgbWFrZXMgc2Vuc2UsIEkgY2Fu
IGRyYWZ0IHBhdGNoIHRvIHNlZSBpZiB0aGVyZSdzIGFueSBkaWZmZXJlbmNlLgoKRnJhbmtseSBJ
IHdvdWxkIHByZWZlciB0byBhdm9pZCBJT1ZBcyBvbiB0aGUgZGVzY3JpcHRvciByaW5nIChhbmQg
dGhlCnRoZW4gbmVjZXNzYXJ5IHRyYW5zbGF0aW9uKSBmb3IgdmlydGlvLWNjdyBhbHRvZ2V0aGVy
LiBCdXQgTWljaGFlbAp2b2ljZWQgaGlzIG9waW5pb24gdGhhdCB3ZSBzaG91bGQgbWFuZGF0ZSBG
X0lPTU1VX1BMQVRGT1JNIGZvciBkZXZpY2VzCnRoYXQgY291bGQgYmUgdXNlZCB3aXRoIGd1ZXN0
cyBydW5uaW5nIGluIHByb3RlY3RlZCBtb2RlLiBJIGRvbid0IHNoYXJlCmhpcyBvcGluaW9uLCBi
dXQgdGhhdCdzIGFuIG9uZ29pbmcgZGlzY3Vzc2lvbi4KClNob3VsZCB3ZSBlbmQgdXAgaGF2aW5n
IHRvIGRvIHRyYW5zbGF0aW9uIGZyb20gSU9WQSBpbiB2aG9zdCwgd2UgYXJlCnZlcnkgaW50ZXJl
c3RlZCBpbiB0aGF0IHRyYW5zbGF0aW9uIGJlaW5nIGZhc3QgYW5kIGVmZmljaWVudC4KCkluIHRo
YXQgc2Vuc2Ugd2Ugd291bGQgYmUgdmVyeSBoYXBweSB0byB0ZXN0IGFueSBvcHRpbWl6YXRpb24g
dGhhdCBhaW0KaW50byB0aGF0IGRpcmVjdGlvbi4KClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlv
dXIgaW5wdXQhCgpSZWdhcmRzLApIYWxpbAoKPiAKPiBUaGFua3MKPiAKPiAKPiA+Cj4gPiBIYWxp
bCBQYXNpYyAoMik6Cj4gPiAgICBtbTogbW92ZSBmb3JjZV9kbWFfdW5lbmNyeXB0ZWQoKSB0byBt
ZW1fZW5jcnlwdC5oCj4gPiAgICB2aXJ0aW86IGxldCB2aXJ0aW8gdXNlIERNQSBBUEkgd2hlbiBn
dWVzdCBSQU0gaXMgcHJvdGVjdGVkCj4gPgo+ID4gICBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmlu
Zy5jIHwgIDMgKysrCj4gPiAgIGluY2x1ZGUvbGludXgvZG1hLWRpcmVjdC5oICAgfCAgOSAtLS0t
LS0tLS0KPiA+ICAgaW5jbHVkZS9saW51eC9tZW1fZW5jcnlwdC5oICB8IDEwICsrKysrKysrKysK
PiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+
ID4KPiA+Cj4gPiBiYXNlLWNvbW1pdDogY2E3ZTFmZDEwMjZjNWFmNmE1MzNiNGI1NDQ3ZTFkMmYx
NTNlMjhmMgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
