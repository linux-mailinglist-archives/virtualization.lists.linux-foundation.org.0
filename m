Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3884E949
	for <lists.virtualization@lfdr.de>; Fri, 21 Jun 2019 15:36:40 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7B542F34;
	Fri, 21 Jun 2019 13:36:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CAE5BF2D
	for <virtualization@lists.linux-foundation.org>;
	Fri, 21 Jun 2019 13:36:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 09CCB831
	for <virtualization@lists.linux-foundation.org>;
	Fri, 21 Jun 2019 13:36:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A1642F8BEF;
	Fri, 21 Jun 2019 13:35:57 +0000 (UTC)
Received: from dhcp201-121.englab.pnq.redhat.com (ovpn-116-60.sin2.redhat.com
	[10.67.116.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 832375B68D;
	Fri, 21 Jun 2019 13:35:00 +0000 (UTC)
From: Pankaj Gupta <pagupta@redhat.com>
To: dm-devel@redhat.com, linux-nvdimm@lists.01.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	kvm@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-acpi@vger.kernel.org, qemu-devel@nongnu.org,
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v14 0/7] virtio pmem driver 
Date: Fri, 21 Jun 2019 19:04:48 +0530
Message-Id: <20190621133455.3303-1-pagupta@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 21 Jun 2019 13:36:16 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: pagupta@redhat.com, rdunlap@infradead.org, jack@suse.cz, snitzer@redhat.com,
	mst@redhat.com, david@fromorbit.com, lcapitulino@redhat.com,
	adilger.kernel@dilger.ca, zwisler@kernel.org,
	aarcange@redhat.com, dave.jiang@intel.com, jstaron@google.com,
	darrick.wong@oracle.com, vishal.l.verma@intel.com,
	willy@infradead.org, hch@infradead.org, jmoyer@redhat.com,
	nilal@redhat.com, lenb@kernel.org, kilobyte@angband.pl,
	riel@surriel.com, yuval.shaia@oracle.com, stefanha@redhat.com,
	pbonzini@redhat.com, dan.j.williams@intel.com, tytso@mit.edu,
	xiaoguangrong.eric@gmail.com, cohuck@redhat.com,
	rjw@rjwysocki.net, imammedo@redhat.com
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

IFRoaXMgcGF0Y2ggc2VyaWVzIGlzIHJlYWR5IHRvIGJlIG1lcmdlZCB2aWEgbnZkaW1tIHRyZWUK
IGFzIGRpc2N1c3NlZCB3aXRoIERhbi4gV2UgaGF2ZSBhY2svcmV2aWV3IG9uIFhGUywgRVhUNAog
ZGV2aWNlIG1hcHBlciAmIFZJUlRJTyBwYXRjaGVzLgoKIFRoaXMgdmVyc2lvbiBoYXMgZml4IGZv
ciB0ZXN0IGJvdCBidWlsZCBmYWlsdXJlLiBLZWVwaW5nCiBhbGwgdGhlIGV4aXN0aW5nIHItby1i
cy4gSmFrb2IgQ0NlZCBhbHNvIHRlc3RlZCB0aGUgcGF0Y2gKIHNlcmllcyBhbmQgY29uZmlybWVk
IHRoZSB3b3JraW5nIG9mIHY5LgogLS0tCgogVGhpcyBwYXRjaCBzZXJpZXMgaGFzIGltcGxlbWVu
dGF0aW9uIGZvciAidmlydGlvIHBtZW0iLiAKICJ2aXJ0aW8gcG1lbSIgaXMgZmFrZSBwZXJzaXN0
ZW50IG1lbW9yeShudmRpbW0pIGluIGd1ZXN0IAogd2hpY2ggYWxsb3dzIHRvIGJ5cGFzcyB0aGUg
Z3Vlc3QgcGFnZSBjYWNoZS4gVGhpcyBhbHNvCiBpbXBsZW1lbnRzIGEgVklSVElPIGJhc2VkIGFz
eW5jaHJvbm91cyBmbHVzaCBtZWNoYW5pc20uICAKIAogU2hhcmluZyBndWVzdCBrZXJuZWwgZHJp
dmVyIGluIHRoaXMgcGF0Y2hzZXQgd2l0aCB0aGUgCiBjaGFuZ2VzIHN1Z2dlc3RlZCBpbiB2NC4g
VGVzdGVkIHdpdGggUWVtdSBzaWRlIGRldmljZSAKIGVtdWxhdGlvbiBbNV0gZm9yIHZpcnRpby1w
bWVtLiBEb2N1bWVudGVkIHRoZSBpbXBhY3Qgb2YKIHBvc3NpYmxlIHBhZ2UgY2FjaGUgc2lkZSBj
aGFubmVsIGF0dGFja3Mgd2l0aCBzdWdnZXN0ZWQKIGNvdW50ZXJtZWFzdXJlcy4KCiBEZXRhaWxz
IG9mIHByb2plY3QgaWRlYSBmb3IgJ3ZpcnRpbyBwbWVtJyBmbHVzaGluZyBpbnRlcmZhY2UgCiBp
cyBzaGFyZWQgWzNdICYgWzRdLgoKIEltcGxlbWVudGF0aW9uIGlzIGRpdmlkZWQgaW50byB0d28g
cGFydHM6CiBOZXcgdmlydGlvIHBtZW0gZ3Vlc3QgZHJpdmVyIGFuZCBxZW11IGNvZGUgY2hhbmdl
cyBmb3IgbmV3IAogdmlydGlvIHBtZW0gcGFyYXZpcnR1YWxpemVkIGRldmljZS4KCjEuIEd1ZXN0
IHZpcnRpby1wbWVtIGtlcm5lbCBkcml2ZXIKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCiAgIC0gUmVhZHMgcGVyc2lzdGVudCBtZW1vcnkgcmFuZ2UgZnJvbSBwYXJhdmlydCBkZXZp
Y2UgYW5kIAogICAgIHJlZ2lzdGVycyB3aXRoICdudmRpbW1fYnVzJy4gIAogICAtICdudmRpbW0v
cG1lbScgZHJpdmVyIHVzZXMgdGhpcyBpbmZvcm1hdGlvbiB0byBhbGxvY2F0ZSAKICAgICBwZXJz
aXN0ZW50IG1lbW9yeSByZWdpb24gYW5kIHNldHVwIGZpbGVzeXN0ZW0gb3BlcmF0aW9ucyAKICAg
ICB0byB0aGUgYWxsb2NhdGVkIG1lbW9yeS4gCiAgIC0gdmlydGlvIHBtZW0gZHJpdmVyIGltcGxl
bWVudHMgYXN5bmNocm9ub3VzIGZsdXNoaW5nIAogICAgIGludGVyZmFjZSB0byBmbHVzaCBmcm9t
IGd1ZXN0IHRvIGhvc3QuCgoyLiBRZW11IHZpcnRpby1wbWVtIGRldmljZQotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KICAgLSBDcmVhdGVzIHZpcnRpbyBwbWVtIGRldmljZSBhbmQg
ZXhwb3NlcyBhIG1lbW9yeSByYW5nZSB0byAKICAgICBLVk0gZ3Vlc3QuIAogICAtIEF0IGhvc3Qg
c2lkZSB0aGlzIGlzIGZpbGUgYmFja2VkIG1lbW9yeSB3aGljaCBhY3RzIGFzIAogICAgIHBlcnNp
c3RlbnQgbWVtb3J5LiAKICAgLSBRZW11IHNpZGUgZmx1c2ggdXNlcyBhaW8gdGhyZWFkIHBvb2wg
QVBJJ3MgYW5kIHZpcnRpbyAKICAgICBmb3IgYXN5bmNocm9ub3VzIGd1ZXN0IG11bHRpIHJlcXVl
c3QgaGFuZGxpbmcuIAoKIFZpcnRpby1wbWVtIHNlY3VyaXR5IGltcGxpY2F0aW9ucyBhbmQgY291
bnRlcm1lYXN1cmVzOgogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KCiBJbiBwcmV2aW91cyBwb3N0aW5nIG9mIGtlcm5lbCBkcml2ZXIsIHRoZXJl
IHdhcyBkaXNjdXNzaW9uIFs3XQogb24gcG9zc2libGUgaW1wbGljYXRpb25zIG9mIHBhZ2UgY2Fj
aGUgc2lkZSBjaGFubmVsIGF0dGFja3Mgd2l0aCAKIHZpcnRpbyBwbWVtLiBBZnRlciB0aG9yb3Vn
aCBhbmFseXNpcyBvZiBkZXRhaWxzIG9mIGtub3duIHNpZGUgCiBjaGFubmVsIGF0dGFja3MsIGJl
bG93IGFyZSB0aGUgc3VnZ2VzdGlvbnM6CgogLSBEZXBlbmRzIGVudGlyZWx5IG9uIGhvdyBob3N0
IGJhY2tpbmcgaW1hZ2UgZmlsZSBpcyBtYXBwZWQgCiAgIGludG8gZ3Vlc3QgYWRkcmVzcyBzcGFj
ZS4gCgogLSB2aXJ0aW8tcG1lbSBkZXZpY2UgZW11bGF0aW9uLCBieSBkZWZhdWx0IHNoYXJlZCBt
YXBwaW5nIGlzIHVzZWQKICAgdG8gbWFwIGhvc3QgYmFja2luZyBmaWxlLiBJdCBpcyByZWNvbW1l
bmRlZCB0byB1c2Ugc2VwYXJhdGUKICAgYmFja2luZyBmaWxlIGF0IGhvc3Qgc2lkZSBmb3IgZXZl
cnkgZ3Vlc3QuIFRoaXMgd2lsbCBwcmV2ZW50CiAgIGFueSBwb3NzaWJpbGl0eSBvZiBleGVjdXRp
bmcgY29tbW9uIGNvZGUgZnJvbSBtdWx0aXBsZSBndWVzdHMKICAgYW5kIGFueSBjaGFuY2Ugb2Yg
aW5mZXJyaW5nIGd1ZXN0IGxvY2FsIGRhdGEgYmFzZWQgYmFzZWQgb24gCiAgIGV4ZWN1dGlvbiB0
aW1lLgoKIC0gSWYgYmFja2luZyBmaWxlIGlzIHJlcXVpcmVkIHRvIGJlIHNoYXJlZCBhbW9uZyBt
dWx0aXBsZSBndWVzdHMgCiAgIGl0IGlzIHJlY29tbWVuZGVkIHRvIGRvbid0IHN1cHBvcnQgaG9z
dCBwYWdlIGNhY2hlIGV2aWN0aW9uIAogICBjb21tYW5kcyBmcm9tIHRoZSBndWVzdCBkcml2ZXIu
IFRoaXMgd2lsbCBhdm9pZCBhbnkgcG9zc2liaWxpdHkKICAgb2YgaW5mZXJyaW5nIGd1ZXN0IGxv
Y2FsIGRhdGEgb3IgaG9zdCBkYXRhIGZyb20gYW5vdGhlciBndWVzdC4gCgogLSBQcm9wb3NlZCBk
ZXZpY2Ugc3BlY2lmaWNhdGlvbiBbNl0gZm9yIHZpcnRpby1wbWVtIGRldmljZSB3aXRoIAogICBk
ZXRhaWxzIG9mIHBvc3NpYmxlIHNlY3VyaXR5IGltcGxpY2F0aW9ucyBhbmQgc3VnZ2VzdGVkIAog
ICBjb3VudGVybWVhc3VyZXMgZm9yIGRldmljZSBlbXVsYXRpb24uCgogVmlydGlvLXBtZW0gZXJy
b3JzIGhhbmRsaW5nOgogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQog
IENoZWNrZWQgYmVoYXZpb3VyIG9mIHZpcnRpby1wbWVtIGZvciBiZWxvdyB0eXBlcyBvZiBlcnJv
cnMKICBOZWVkIHN1Z2dlc3Rpb25zIG9uIGV4cGVjdGVkIGJlaGF2aW91ciBmb3IgaGFuZGxpbmcg
dGhlc2UgZXJyb3JzPwoKICAtIEhhcmR3YXJlIEVycm9yczogVW5jb3JyZWN0YWJsZSByZWNvdmVy
YWJsZSBFcnJvcnM6IAogIGFdIHZpcnRpby1wbWVtOiAKICAgIC0gQXMgcGVyIGN1cnJlbnQgbG9n
aWMgaWYgZXJyb3IgcGFnZSBiZWxvbmdzIHRvIFFlbXUgcHJvY2VzcywgCiAgICAgIGhvc3QgTUNF
IGhhbmRsZXIgaXNvbGF0ZXMoaHdwb2lzb24pIHRoYXQgcGFnZSBhbmQgc2VuZCBTSUdCVVMuIAog
ICAgICBRZW11IFNJR0JVUyBoYW5kbGVyIGluamVjdHMgZXhjZXB0aW9uIHRvIEtWTSBndWVzdC4g
CiAgICAtIEtWTSBndWVzdCB0aGVuIGlzb2xhdGVzIHRoZSBwYWdlIGFuZCBzZW5kIFNJR0JVUyB0
byBndWVzdCAKICAgICAgdXNlcnNwYWNlIHByb2Nlc3Mgd2hpY2ggaGFzIG1hcHBlZCB0aGUgcGFn
ZS4gCiAgCiAgYl0gRXhpc3RpbmcgaW1wbGVtZW50YXRpb24gZm9yIEFDUEkgcG1lbSBkcml2ZXI6
IAogICAgLSBIYW5kbGVzIHN1Y2ggZXJyb3JzIHdpdGggTUNFIG5vdGlmaWVyIGFuZCBjcmVhdGVz
IGEgbGlzdCAKICAgICAgb2YgYmFkIGJsb2Nrcy4gUmVhZC9kaXJlY3QgYWNjZXNzIERBWCBvcGVy
YXRpb24gcmV0dXJuIEVJTyAKICAgICAgaWYgYWNjZXNzZWQgbWVtb3J5IHBhZ2UgZmFsbCBpbiBi
YWQgYmxvY2sgbGlzdC4KICAgIC0gSXQgYWxzbyBzdGFydHMgYmFja2dvdW5kIHNjcnViYmluZy4g
IAogICAgLSBTaW1pbGFyIGZ1bmN0aW9uYWxpdHkgY2FuIGJlIHJldXNlZCBpbiB2aXJ0aW8tcG1l
bSB3aXRoIE1DRSAKICAgICAgbm90aWZpZXIgYnV0IHdpdGhvdXQgc2NydWJiaW5nKG5vIEFDUEkv
QVJTKT8gTmVlZCBpbnB1dHMgdG8gCiAgICAgIGNvbmZpcm0gaWYgdGhpcyBiZWhhdmlvdXIgaXMg
b2sgb3IgbmVlZHMgYW55IGNoYW5nZT8KCkNoYW5nZXMgZnJvbSBQQVRDSCB2MTM6IFsxXSAKIC0g
UmViYXNlZCB0byBMaW51eC01LjItcmM1CiAtIEZpeCBTMzkweCBidWlsZCBmYWlsdXJlIGluIHBh
dGNoIDMKIC0gRml4IGZvciAhQ09ORklHX0RBWCB3aXRoIGRheF9zeW5jaHJvbm91cwogLSBGaXgg
c3BhcnNlIHdhcm5pbmcgaW4gdmlydGlvIHBhdGNoIDIKCkNoYW5nZXMgZnJvbSBQQVRDSCB2MTI6
IFsyXSAKIC0gTWlub3IgY2hhbmdlcyhmdW5jdGlvbiBuYW1lLCBkZXZfZXJyIC0+IGRldl9pbmZv
ICYgCiAgIG1ha2UgZnVuY3Rpb24gc3RhdGljIGluIHZpcnRpbyBwYXRjaCAtIFtDb3JuZWxpYV0K
IC0gQWRkZWQgci1vLWIgb2YgTWlrZSBpbiBwYXRjaCA0CgpDaGFuZ2VzIGZyb20gUEFUQ0ggdjEx
OiAKIC0gQ2hhbmdlIGltcGxtZW50YXRpb24gZm9yIHNldHRpbmcgb2Ygc3luY2hyb25vdXMgREFY
IHR5cGUKICAgZm9yIGRldmljZSBtYXBwZXIgLSBbTWlrZV0gCgpDaGFuZ2VzIGZyb20gUEFUQ0gg
djEwOgogLSBSZWJhc2VkIG9uIExpbnV4LTUuMi1yYzQKCkNoYW5nZXMgZnJvbSBQQVRDSCB2OToK
IC0gS2NvbmZpZyBoZWxwIHRleHQgYWRkIHR3byBzcGFjZXMgLSBSYW5keQogLSBGaXhlZCBsaWJu
dmRpbW0gJ2JpbycgaW5jbHVkZSB3YXJuaW5nIC0gRGFuCiAtIHZpcnRpby1wbWVtLCBzZXBhcmF0
ZSByZXF1ZXN0L3Jlc3Agc3RydWN0IGFuZCAKICAgbW92ZSB0byB1YXBpIGZpbGUgd2l0aCB1cGRh
dGVkIGxpY2Vuc2UgLSBEYXZpZEgKIC0gVXNlIHZpcnRpbzMyKiB0eXBlIGZvciByZXEvcmVzcCBl
bmRpYW5lc3MgLSBEYXZpZEgKIC0gQWRkZWQgdGVzdGVkLWJ5ICYgYWNrLWJ5IG9mIEpha29iCiAt
IFJlYmFzZWQgdG8gNS4yLXJjMQoKQ2hhbmdlcyBmcm9tIFBBVENIIHY4OgogLSBTZXQgZGV2aWNl
IG1hcHBlciBzeW5jaHJvbm91cyBpZiBhbGwgdGFyZ2V0IGRldmljZXMgc3VwcG9ydCAtIERhbgog
LSBNb3ZlIHZpcnRpb19wbWVtLmggdG8gbnZkaW1tIGRpcmVjdG9yeSAgLSBEYW4KIC0gU3R5bGUs
IGluZGVudGF0aW9uICYgYmV0dGVyIGVycm9yIG1lc3NhZ2VzIGluIHBhdGNoIDIgLSBEYXZpZEgK
IC0gQWRkZWQgTVNUJ3MgYWNrIGluIHBhdGNoIDIuCgpDaGFuZ2VzIGZyb20gUEFUQ0ggdjc6CiAt
IENvcnJlY3RlZCBwZW5kaW5nIHJlcXVlc3QgcXVldWUgbG9naWMgKHBhdGNoIDIpIC0gSmFrdWIg
U3Rhcm/FhAogLSBVc2VkIHVuc2lnbmVkIGxvbmcgZmxhZ3MgZm9yIHBhc3NpbmcgREFYREVWX0Zf
U1lOQyAocGF0Y2ggMykgLSBEYW4KIC0gRml4ZWQgdHlwbyA9PiAgdm1hICdmbGFnJyB0byAndm1f
ZmxhZycgKHBhdGNoIDQpCiAtIEFkZGVkIHJvYiBpbiBwYXRjaCA2ICYgcGF0Y2ggMgoKQ2hhbmdl
cyBmcm9tIFBBVENIIHY2OiAKIC0gQ29ycmVjdGVkIGNvbW1lbnQgZm9ybWF0IGluIHBhdGNoIDUg
JiBwYXRjaCA2LiBbRGF2ZV0KIC0gQ2hhbmdlZCB2YXJpYWJsZSBkZWNsYXJhdGlvbiBpbmRlbnRh
dGlvbiBpbiBwYXRjaCA2IFtEYXJyaWNrXQogLSBBZGQgUmV2aWV3ZWQtYnkgdGFnIGJ5ICdKYW4g
S2FyYScgaW4gcGF0Y2ggNCAmIHBhdGNoIDUKCkNoYW5nZXMgZnJvbSBQQVRDSCB2NTogCiAgQ2hh
bmdlcyBzdWdnZXN0ZWQgaW4gYnkgLSBbQ29ybmVsaWEsIFl1dmFsXQotIFJlbW92ZSBhc3NpZ25t
ZW50IGNoYWluaW5nIGluIHZpcnRpbyBkcml2ZXIKLSBCZXR0ZXIgZXJyb3IgbWVzc2FnZSBhbmQg
cmVtb3ZlIG5vdCByZXF1aXJlZCBmcmVlCi0gQ2hlY2sgbmRfcmVnaW9uIGJlZm9yZSB1c2UKCiAg
Q2hhbmdlcyBzdWdnZXN0ZWQgYnkgLSBbSmFuIEthcmFdCi0gZGF4X3N5bmNocm9ub3VzKCkgZm9y
ICFDT05GSUdfREFYCi0gQ29ycmVjdCAnZGF4ZGV2X21hcHBpbmdfc3VwcG9ydGVkJyBjb21tZW50
IGFuZCBub24tZGF4IGltcGxlbWVudGF0aW9uCgogIENoYW5nZXMgc3VnZ2VzdGVkIGJ5IC0gW0Rh
biBXaWxsaWFtc10KLSBQYXNzIG1lYW5pbmdmdWwgZmxhZyAnREFYREVWX0ZfU1lOQycgdG8gYWxs
b2NfZGF4Ci0gR2F0ZSBudmRpbW1fZmx1c2ggaW5zdGVhZCBvZiBhZGRpdGlvbmFsIGFzeW5jIHBh
cmFtZXRlcgotIE1vdmUgYmxvY2sgY2hhaW5pbmcgbG9naWMgdG8gZmx1c2ggY2FsbGJhY2sgdGhh
biBjb21tb24gbnZkaW1tX2ZsdXNoCi0gVXNlIE5VTEwgZmx1c2ggY2FsbGJhY2sgZm9yIGdlbmVy
aWMgZmx1c2ggZm9yIGJldHRlciByZWFkYWJpbGl0eSBbRGFuLCBKYW5dCgotIFVzZSB2aXJ0aW8g
ZGV2aWNlIGlkIDI3IGZyb20gMjUoYWxyZWFkeSB1c2VkKSAtIFtNU1RdCgpDaGFuZ2VzIGZyb20g
UEFUQ0ggdjQ6Ci0gRmFjdG9yIG91dCBNQVBfU1lOQyBzdXBwb3J0ZWQgZnVuY3Rpb25hbGl0eSB0
byBhIGNvbW1vbiBoZWxwZXIKCQkJCVtEYXZlLCBEYXJyaWNrLCBKYW5dCi0gQ29tbWVudCwgaW5k
ZW50YXRpb24gYW5kIHZpcnRxdWV1ZV9raWNrIGZhaWx1cmUgaGFuZGxlIC0gWXV2YWwgU2hhaWEK
CkNoYW5nZXMgZnJvbSBQQVRDSCB2MzogCi0gVXNlIGdlbmVyaWMgZGF4X3N5bmNocm9ub3VzKCkg
aGVscGVyIHRvIGNoZWNrIGZvciBEQVhERVZfU1lOQyAKICBmbGFnIC0gW0RhbiwgRGFycmljaywg
SmFuXQotIEFkZCAnaXNfbnZkaW1tX2FzeW5jJyBmdW5jdGlvbgotIERvY3VtZW50IHBhZ2UgY2Fj
aGUgc2lkZSBjaGFubmVsIGF0dGFja3MgaW1wbGljYXRpb25zICYgCiAgY291bnRlcm1lYXN1cmVz
IC0gW0RhdmUgQ2hpbm5lciwgTWljaGFlbF0KCkNoYW5nZXMgZnJvbSBQQVRDSCB2MjogCi0gRGlz
YWJsZSBNQVBfU1lOQyBmb3IgZXh0NCAmIFhGUyBmaWxlc3lzdGVtcyAtIFtEYW5dIAotIFVzZSBu
YW1lICd2aXJ0aW8gcG1lbScgaW4gcGxhY2Ugb2YgJ2Zha2UgZGF4JyAKCkNoYW5nZXMgZnJvbSBQ
QVRDSCB2MTogCi0gMC1kYXkgYnVpbGQgdGVzdCBmb3IgYnVpbGQgZGVwZW5kZW5jeSBvbiBsaWJu
dmRpbW0gCgogQ2hhbmdlcyBzdWdnZXN0ZWQgYnkgLSBbRGFuIFdpbGxpYW1zXQotIFNwbGl0IHRo
ZSBkcml2ZXIgaW50byB0d28gcGFydHMgdmlydGlvICYgcG1lbSAgCi0gTW92ZSBxdWV1aW5nIG9m
IGFzeW5jIGJsb2NrIHJlcXVlc3QgdG8gYmxvY2sgbGF5ZXIKLSBBZGQgInN5bmMiIHBhcmFtZXRl
ciBpbiBudmRpbW1fZmx1c2ggZnVuY3Rpb24KLSBVc2UgaW5kaXJlY3QgY2FsbCBmb3IgbnZkaW1t
X2ZsdXNoCi0gRG9u4oCZdCBtb3ZlIGRlY2xhcmF0aW9ucyB0byBjb21tb24gZ2xvYmFsIGhlYWRl
ciBlLmcgbmQuaAotIG52ZGltbV9mbHVzaCgpIHJldHVybiAwIG9yIC1FSU8gaWYgaXQgZmFpbHMK
LSBUZWFjaCBuc2lvX3J3X2J5dGVzKCkgdGhhdCB0aGUgZmx1c2ggY2FuIGZhaWwKLSBSZW5hbWUg
bnZkaW1tX2ZsdXNoKCkgdG8gZ2VuZXJpY19udmRpbW1fZmx1c2goKQotIFVzZSAnbmRfcmVnaW9u
LT5wcm92aWRlcl9kYXRhJyBmb3IgbG9uZyBkZXJlZmVyZW5jaW5nCi0gUmVtb3ZlIHZpcnRpb19w
bWVtX2ZyZWV6ZS9yZXN0b3JlIGZ1bmN0aW9ucwotIFJlbW92ZSBCU0QgbGljZW5zZSB0ZXh0IHdp
dGggU1BEWCBsaWNlbnNlIHRleHQKCi0gQWRkIG1pZ2h0X3NsZWVwKCkgaW4gdmlydGlvX3BtZW1f
Zmx1c2ggLSBbTHVpel0KLSBNYWtlIHNwaW5fbG9ja19pcnFzYXZlKCkgbmFycm93CgpQYW5rYWog
R3VwdGEgKDcpOgogICBsaWJudmRpbW06IG5kX3JlZ2lvbiBmbHVzaCBjYWxsYmFjayBzdXBwb3J0
CiAgIHZpcnRpby1wbWVtOiBBZGQgdmlydGlvLXBtZW0gZ3Vlc3QgZHJpdmVyCiAgIGxpYm52ZGlt
bTogYWRkIG5kX3JlZ2lvbiBidWZmZXJlZCBkYXhfZGV2IGZsYWcKICAgZGF4OiBjaGVjayBzeW5j
aHJvbm91cyBtYXBwaW5nIGlzIHN1cHBvcnRlZAogICBkbTogZG06IEVuYWJsZSBzeW5jaHJvbm91
cyBkYXgKICAgZXh0NDogZGlzYWJsZSBtYXBfc3luYyBmb3IgdmlydGlvIHBtZW0KICAgeGZzOiBk
aXNhYmxlIG1hcF9zeW5jIGZvciB2aXJ0aW8gcG1lbQoKWzFdIGh0dHBzOi8vbGttbC5vcmcvbGtt
bC8yMDE5LzYvMTIvNjI0ClsyXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS82LzExLzgzMQpb
M10gaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMva3ZtL21zZzE0OTc2MS5odG1sCls0XSBo
dHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9rdm0vbXNnMTUzMDk1Lmh0bWwgIApbNV0gaHR0
cHM6Ly9tYXJjLmluZm8vP2w9cWVtdS1kZXZlbCZtPTE1NTg2MDc1MTIwMjIwMiZ3PTIKWzZdIGh0
dHBzOi8vbGlzdHMub2FzaXMtb3Blbi5vcmcvYXJjaGl2ZXMvdmlydGlvLWRldi8yMDE5MDMvbXNn
MDAwODMuaHRtbApbN10gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvMS85LzExOTEKCiBkcml2
ZXJzL2FjcGkvbmZpdC9jb3JlLmMgICAgICAgICB8ICAgIDQgLQogZHJpdmVycy9kYXgvYnVzLmMg
ICAgICAgICAgICAgICAgfCAgICAyIAogZHJpdmVycy9kYXgvc3VwZXIuYyAgICAgICAgICAgICAg
fCAgIDE5ICsrKysrCiBkcml2ZXJzL21kL2RtLXRhYmxlLmMgICAgICAgICAgICB8ICAgMjQgKysr
KystLQogZHJpdmVycy9tZC9kbS5jICAgICAgICAgICAgICAgICAgfCAgICA1IC0KIGRyaXZlcnMv
bWQvZG0uaCAgICAgICAgICAgICAgICAgIHwgICAgNSArCiBkcml2ZXJzL252ZGltbS9NYWtlZmls
ZSAgICAgICAgICB8ICAgIDEgCiBkcml2ZXJzL252ZGltbS9jbGFpbS5jICAgICAgICAgICB8ICAg
IDYgKwogZHJpdmVycy9udmRpbW0vbmQuaCAgICAgICAgICAgICAgfCAgICAxIAogZHJpdmVycy9u
dmRpbW0vbmRfdmlydGlvLmMgICAgICAgfCAgMTI1ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogZHJpdmVycy9udmRpbW0vcG1lbS5jICAgICAgICAgICAgfCAgIDE4ICsr
Ky0tCiBkcml2ZXJzL252ZGltbS9yZWdpb25fZGV2cy5jICAgICB8ICAgMzMgKysrKysrKysrLQog
ZHJpdmVycy9udmRpbW0vdmlydGlvX3BtZW0uYyAgICAgfCAgMTIyICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL252ZGltbS92aXJ0aW9fcG1lbS5oICAgICB8
ICAgNTUgKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvczM5MC9ibG9jay9kY3NzYmxrLmMgICAg
IHwgICAgMiAKIGRyaXZlcnMvdmlydGlvL0tjb25maWcgICAgICAgICAgIHwgICAxMSArKysKIGZz
L2V4dDQvZmlsZS5jICAgICAgICAgICAgICAgICAgIHwgICAxMCArLS0KIGZzL3hmcy94ZnNfZmls
ZS5jICAgICAgICAgICAgICAgIHwgICAgOSArLQogaW5jbHVkZS9saW51eC9kYXguaCAgICAgICAg
ICAgICAgfCAgIDQxICsrKysrKysrKysrKwogaW5jbHVkZS9saW51eC9saWJudmRpbW0uaCAgICAg
ICAgfCAgIDEwICsrLQogaW5jbHVkZS91YXBpL2xpbnV4L3ZpcnRpb19pZHMuaCAgfCAgICAxIAog
aW5jbHVkZS91YXBpL2xpbnV4L3ZpcnRpb19wbWVtLmggfCAgIDM1ICsrKysrKysrKysKIDIyIGZp
bGVzIGNoYW5nZWQsIDUwNSBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlvbnMoLSkKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
